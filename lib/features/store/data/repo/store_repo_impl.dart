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
    String? sortBy,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      final queryParams = {'per_page': '20'};

      if (onSale == true) queryParams['on_sale'] = 'true';
      if (inStock == true) queryParams['stock_status'] = 'instock';

      switch (sortBy ?? 'default') {
        case 'popular':
          queryParams['orderby'] = 'popularity';
          queryParams['order'] = 'desc';
          break;
        case 'topPriced':
          queryParams['orderby'] = 'price';
          queryParams['order'] = 'desc';
          break;
        case 'newest':
          queryParams['orderby'] = 'date';
          queryParams['order'] = 'desc';
          break;
        default:
          queryParams['orderby'] = 'menu_order';
          queryParams['order'] = 'asc';
      }

      if (minPrice != null) queryParams['min_price'] = minPrice.toString();
      if (maxPrice != null) queryParams['max_price'] = maxPrice.toString();

      var data = await apiService.get(
        endpoint: 'products',
        queryParams: queryParams,
      );

      List<ProductModel> products =
          data
              .map<ProductModel>((item) => ProductModel.fromJson(item))
              .toList();

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
