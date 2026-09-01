import 'package:dio/dio.dart';

class NewsService {
  final Dio dio = Dio();

  /// Fetches the top headlines based on the provided [category].
  ///
  /// This method uses the News API to fetch the data.
  /// You can generate your own API key from: https://newsapi.org/
}