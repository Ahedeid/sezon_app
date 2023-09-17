import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/user_model.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/services/authServices/phone_auth_exceptions.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:sezon_app/service_locator.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(sl<FirebaseAuth>().currentUser);
    firebaseUser.bindStream(sl<FirebaseAuth>().userChanges());
    ever(firebaseUser, (callback) => _setInitialScreen);
  }

  createUser(UserModel user) async {
    var ref =
        await sl<FirebaseFirestore>().collection('Users').add(user.toJson());
    sl<SharedPrefController>().login(user);
    sl<SharedPrefController>().setId(id: ref.id);
  }

  // ----------------------- User Login ----------------------------------------
  Future<bool> login(
      {required String userName, required String password}) async {
    final snapshot = await sl<FirebaseFirestore>()
        .collection('Users')
        .where('FullName', isEqualTo: userName)
        .where('Password', isEqualTo: password)
        .get();

    if (snapshot.docs.isNotEmpty) {
      sl<SharedPrefController>().login(snapshot.docs.map((e) {
        sl<SharedPrefController>().setId(id: e.id);
        return UserModel.fromSnapshot(e);
      }).single);
      return true;
    } else {
      return false;
    }
  }

  // ----------------------- Set Initial Screen --------------------------------

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAllNamed(RouteName.loginRoute)
        : Get.offAllNamed(RouteName.mainRoute);
  }

  Future<bool> _checkUser(String phone) async {
    final snapshot = await sl<FirebaseFirestore>()
        .collection('Users')
        .where('Phone', isEqualTo: phone)
        .get();
    return snapshot.docs.isEmpty ? true : false;
  }

  // ----------------------- Phone Verification --------------------------------

  Future<String> phoneVerification({required String phoneNumber}) async {
    String result = '';
    if (await _checkUser(phoneNumber)) {
      sl<FirebaseAuth>().verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          sl<FirebaseAuth>().signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            result = 'invalid phone number';
          } else {
            result = 'something went wrong';
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } else {
      result = 'Phone Number Already taken';
    }
    return result;
  }

  // ----------------------- Verify Code --------------------------------

  Future<String> verifyCode({required String otpCode}) async {
    try {
      var credential = await sl<FirebaseAuth>().signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId.value, smsCode: otpCode));

      return '';
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return PhoneAuthExceptionHandler.handleException(e);
      }
      return 'something went wrong';
    }
  }

  signOut() async => await FirebaseAuth.instance.signOut();
}
