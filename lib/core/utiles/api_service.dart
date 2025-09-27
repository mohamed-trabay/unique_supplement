import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://testapp.zbooma.com/wp-json/wc/v3/';
  final _consumerKey = 'ck_2a500a41627727c2111dc2ab294f4f8120a4ec71';
  final _consumerSecret = 'cs_ebdee3f3beaf55841668f42f9cb72942e06f4bb2';

  final Dio _dio;
  ApiService(this._dio);

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final fullQuery = {
      'consumer_key': _consumerKey,
      'consumer_secret': _consumerSecret,
      ...?queryParams,
    };

    var response = await _dio.get(
      '$_baseUrl$endpoint',
      queryParameters: fullQuery,
    );

    return response.data;
  }
}
