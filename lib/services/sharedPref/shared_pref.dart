import 'dart:convert';
import 'package:sezon_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { user, isLoggedIn, id }

class SharedPrefController {
  SharedPreferences preferences;

  SharedPrefController({required this.preferences});

  save(UserModel user) async {
    String userEncoded = jsonEncode(user.toJson());
    await preferences.setString(
      PrefKeys.user.toString(),
      userEncoded,
    );
  }

  UserModel getUser() {
    String userJson = preferences.getString(PrefKeys.user.toString()) ?? '';
    final userObject = jsonDecode(userJson);
    return UserModel.fromJson(userObject);
  }

  isLoggedIn({required bool value}) {
    preferences.setBool(PrefKeys.isLoggedIn.toString(), value);
  }

  bool getLoggedIn() {
    return preferences.getBool(PrefKeys.isLoggedIn.toString()) ?? false;
  }

  clear() {
    preferences.clear();
  }

  remove() {
    preferences.remove(PrefKeys.user.toString());
  }

  logout() {
    isLoggedIn(value: false);
    remove();
  }

  login(UserModel user) {
    isLoggedIn(value: true);
    save(user);
  }

  setId({required String id}) {
    preferences.setString(PrefKeys.id.toString(), id);
  }

  String getId() {
    return preferences.getString(PrefKeys.id.toString()) ?? '';
  }
}
