import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'app_exception.dart';
import 'base_service.dart';


class RequestService extends BaseService {

  @override
  Future getResponse(String endPoint) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(apiBaseUrl + endPoint));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
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
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server: ${response.statusCode}'
        );
    }
  }
}