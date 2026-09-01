import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_app/core/networking/api_endpoints.dart';

class DioHelper {
  static Dio? dio;

  static void initDio() {
    dio ??= Dio(
      BaseOptions(
  baseUrl: ApiEndpoints.baseUrl,
  receiveDataWhenStatusError: true,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
)
    );
  }

  static Future<Response<dynamic>> getRequest({
    required String endPoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    try {
      Response response = await dio!.get(
        endPoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'server_error'.tr());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
