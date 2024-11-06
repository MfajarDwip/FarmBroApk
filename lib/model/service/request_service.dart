import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'app_exception.dart';
import 'base_service.dart';


class RequestService extends BaseService {

  @override
  Future getResponse(String endPoint) async {
    try {
      final response = await http.get(Uri.parse(BaseService.apiBaseUrl + endPoint)
      ).timeout(const Duration(seconds: BaseService.timeoutDuration));
      responseJson = returnResponse(response);
    } on TimeOutException {
      throw TimeOutException('Internet tidak tersedia');
    }
    return responseJson;
  }

  @override
  Future postResponse(String endPoint, Map<String, dynamic> rawJSON) async {
    try {
      final response = await http.post(Uri.parse(BaseService.apiBaseUrl + endPoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(rawJSON)
      ).timeout(const Duration(seconds: BaseService.timeoutDuration));
      responseJson = returnResponse(response);
    } on TimeOutException {
      throw TimeOutException('Internet tidak tersedia');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case >= 300 && <=399:
        throw InvalidInputException("Isi email anda dengan benar");
      case >= 500 && <=599:
        throw ServerException("Galat server: ${response.statusCode}");
      default:
        throw FetchDataException('error ${response.statusCode}');
    }
  }
}