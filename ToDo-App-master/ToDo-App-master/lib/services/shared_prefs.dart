import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapps/models/user_model.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String keyUser = 'keyUser';

  Future<UserModel?> getUser() async {
    SharedPreferences prefs = await _prefs;
    String? data = prefs.getString(keyUser);
    if (data == null) return null;

    print('object $data');

    Map<String, dynamic> map = jsonDecode(data);

    print('object $map');

    UserModel user = UserModel.fromJson(map);
    return user;
  }

  Future<void> saveUser(UserModel user) async {
    SharedPreferences prefs = await _prefs;
    Map<String, dynamic> map = user.toJson();
    prefs.setString(keyUser, jsonEncode(map));
  }
}
