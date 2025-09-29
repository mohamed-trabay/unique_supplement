import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unique_supplement/core/errors/failures.dart';
import 'package:unique_supplement/core/utiles/api_service.dart';
import 'package:unique_supplement/features/home/data/models/category_model.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

import 'package:unique_supplement/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> fetchNewestProduct() async {
    try {
      var data = await apiService.get(
        endpoint: 'products',
        queryParams: {'per_page': 20, 'orderby': 'date', 'order': 'desc'},
      );

      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      var data = await apiService.get(
        endpoint: 'products/categories',
        queryParams: {'per_page': 20},
      );

      List<CategoryModel> categories = [];
      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
