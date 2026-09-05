import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/api_infos.dart';
import 'package:news_app/core/networking/dio_helper.dart';

class SearchServices {
  Future<dynamic> getSearchResults(String search) async {
    try {
      Map<String, dynamic> queryParams = {
        'apiKey': ApiInfos.apiKey,
        'q': search,
      };
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.search,
        queryParameters: queryParams,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
