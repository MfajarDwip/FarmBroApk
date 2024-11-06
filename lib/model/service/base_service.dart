abstract class BaseService{
  static const String apiBaseUrl = 'https://farmbro-mbkm.research-ai.my.id/api/';
  static const int timeoutDuration = 5;
  dynamic responseJson;

  Future<dynamic> getResponse(String endPoint);

  Future<dynamic> postResponse(String endPoint, Map<String, dynamic> rawJSON);
}