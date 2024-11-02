import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'app_exception.dart';
import 'base_service.dart';


class RequestService extends BaseService {
  final int timeoutDuration = 5;

  @override
  Future getResponse(String endPoint) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(apiBaseUrl + endPoint)
      ).timeout(Duration(seconds: timeoutDuration));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(toString());
    } on TimeOutException {
      throw TimeOutException('Internet tidak tersedia');
    }
    return responseJson;
  }

  @override
  Future postResponse(String endPoint, Map<String, dynamic> rawJSON) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(apiBaseUrl + endPoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(rawJSON)
      ).timeout(Duration(seconds: timeoutDuration));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("Galat");
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
        throw FetchDataException('error ${response.statusCode}'
        );
    }
  }
}