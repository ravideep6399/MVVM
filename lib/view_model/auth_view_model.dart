import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/models/usermodel.dart';
import 'package:mvvm/repository/auth_repo.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/userviewviewmodel.dart';

class AuthViewModel with ChangeNotifier {
  final myrepo = AuthRepository();
  final user = UserViewViewModel();
  bool _signupLoading = false;
  bool _loading = false;
  bool get loading => _loading;
  bool get signuploading => _signupLoading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    myrepo.loginApi(data).then((value) {
      setLoading(false);
      UserModel u = UserModel.fromJson(value);
      user.saveUser(u);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.flushbarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signin(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    myrepo.registerApi(data).then((value) {
      setSignupLoading(false);
      UserModel u = UserModel.fromJson(value);
      user.saveUser(u);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.flushbarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
