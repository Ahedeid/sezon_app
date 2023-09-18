import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sezon_app/models/user_model.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';

class ProfileService extends GetxController {
  static ProfileService get instance => Get.find();

  final FirebaseStorage _storage = sl<FirebaseStorage>();
  final FirebaseFirestore _firestore = sl<FirebaseFirestore>();

  Future<UserModel> getUserDetails() async {
    final snapshot = await _firestore
        .collection('Users')
        .where('Phone',
            isEqualTo: sl<SharedPrefController>().getUser().phoneNumber)
        .get();
    return snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  }
// ----------------------- Upload Image To Storage -----------------------------

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required Uint8List file,
  }) async {
    String resp = "error";
    try {
      String imageUrl = await uploadImageToStorage(
          'profileImage${Random().nextInt(1000)}', file);
      debugPrint(imageUrl);
      await _firestore
          .collection('Users')
          .doc(sl<SharedPrefController>().getId())
          .update({
        'imageLink': imageUrl,
      });

      resp = imageUrl;
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }

  // ----------------------- Edit User Info -----------------------------

  Future<bool> editUserInfo(UserModel userModel) async {
    try {
      await _firestore
          .collection('Users')
          .doc(sl<SharedPrefController>().getId())
          .update({
        'FullName': userModel.fullName,
        'Password': userModel.password,
        'Phone': userModel.phoneNumber
      });
      sl<SharedPrefController>().save(sl<SharedPrefController>()
          .getUser()
          .copyWith(phoneNumber: userModel.phoneNumber));
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}
