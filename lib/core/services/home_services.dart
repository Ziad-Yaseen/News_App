import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/api_infos.dart';
import 'package:news_app/core/networking/dio_helper.dart';

class HomeServices {
  Future<dynamic> getTopHeadlines() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlines,
        queryParameters: {'apiKey': ApiInfos.apiKey, 'country': 'us'},
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
