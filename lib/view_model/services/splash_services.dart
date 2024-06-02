import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/models/usermodel.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/userviewviewmodel.dart';

class SplashServices with ChangeNotifier {
  Future<UserModel> getUserData() {
    return UserViewViewModel().getUser();
  }

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      if (value.token == null || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
