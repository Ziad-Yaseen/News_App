import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/api_infos.dart';
import 'package:news_app/core/networking/dio_helper.dart';

class HomeServices {
  Future<dynamic> getTopHeadlines({String? category}) async {
    try {
      Map<String, dynamic> queryParams = {
        'apiKey': ApiInfos.apiKey,
        'country': 'us',
      };
      
      if (category != null) {
        queryParams['category'] = category;
      }

      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlines,
        queryParameters: queryParams,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}