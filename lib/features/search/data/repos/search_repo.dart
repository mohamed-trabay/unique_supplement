import 'package:dartz/dartz.dart';
import 'package:unique_supplement/core/errors/failures.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductModel>>> searchProducts(String keyword);
}
