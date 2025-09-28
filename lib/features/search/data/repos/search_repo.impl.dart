import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unique_supplement/core/errors/failures.dart';
import 'package:unique_supplement/core/utiles/api_service.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> searchProducts(
    String keyword,
  ) async {
    try {
      var data = await apiService.get(
        endpoint: 'products',
        queryParams: {'search': keyword, 'per_page': '8'},
      );

      List<ProductModel> products =
          (data as List).map((item) => ProductModel.fromJson(item)).toList();

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
