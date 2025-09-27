import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:unique_supplement/core/errors/failures.dart';
import 'package:unique_supplement/core/utiles/api_service.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/store/data/repo/store_repo.dart';

class StoreRepoImpl implements StoreRepo {
  final ApiService apiService;
  StoreRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> fetchFilteredProducts({
    bool? onSale,
    bool? inStock,
    String? orderBy,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      final queryParams = {'per_page': '50'};

      if (onSale == true) queryParams['on_sale'] = 'true';
      if (inStock == true) queryParams['stock_status'] = 'instock';
      if (orderBy != null) queryParams['orderby'] = orderBy;
      if (minPrice != null) queryParams['min_price'] = '$minPrice';
      if (maxPrice != null) queryParams['max_price'] = '$maxPrice';

      var data = await apiService.get(
        endpoint: 'products',
        queryParams: queryParams,
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
}
