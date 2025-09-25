import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unique_supplement/core/errors/failures.dart';
import 'package:unique_supplement/core/utiles/api_service.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model/product_model.dart';
import 'package:unique_supplement/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<ProductModel>>> fetchNewestProduct() async {
    try {
      var data = await apiService.get(
        endpoint:
            'products?per_page=20&consumer_key=ck_2a500a41627727c2111dc2ab294f4f8120a4ec71&consumer_secret=cs_ebdee3f3beaf55841668f42f9cb72942e06f4bb2',
      );

      List<ProductModel> books = [];
      for (var item in data['items']) {
        books.add(ProductModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchcategories() async {
    try {
      var data = await apiService.get(
        endpoint:
            'products/categories?per_page=20&consumer_key=ck_2a500a41627727c2111dc2ab294f4f8120a4ec71&consumer_secret=cs_ebdee3f3beaf55841668f42f9cb72942e06f4bb2',
      );

      List<ProductModel> books = [];
      for (var item in data['items']) {
        books.add(ProductModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
