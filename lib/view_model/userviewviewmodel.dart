import 'package:flutter/material.dart';
import 'package:mvvm/models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewViewModel with ChangeNotifier {

  Future<void> saveUser(UserModel user) async {
    final SharedPreferences sh = await SharedPreferences.getInstance();
    await sh.setString('token', user.token.toString());
    notifyListeners();
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sh = await SharedPreferences.getInstance();
    final String? token = sh.getString('token');

    return UserModel(
      token: token,
    );
  }

  Future<bool> removeUser() async {
    final SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.clear();
  }
}
