import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://testapp.zbooma.com/wp-json/wc/v3/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}
