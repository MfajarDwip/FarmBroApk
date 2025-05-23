import 'package:farmbroapk/model/service/request_service.dart';

class LoginRepository {
  final RequestService _requestService = RequestService();

  Future<dynamic> getUserToken(String email, String password) async {
    dynamic response = await _requestService.postResponse(
        'login',
      {
        'email' : email,
        'password' : password
      }
    );
    return response;
  }
}