import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_urls.dart';

class AuthRepository {
  final BaseApiServices _appSerivices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          _appSerivices.getPostApiResponse(AppURLS.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          _appSerivices.getPostApiResponse(AppURLS.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
