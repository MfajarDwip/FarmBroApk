abstract class BaseService{
  final String apiBaseUrl = 'https://farmbro-mbkm.research-ai.my.id/api/';

  Future<dynamic> getResponse(String endPoint);

  Future<dynamic> postResponse(String endPoint, Map<String, dynamic> rawJSON);
}