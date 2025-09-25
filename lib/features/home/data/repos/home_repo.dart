import 'package:dartz/dartz.dart';
import 'package:unique_supplement/core/errors/failures.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchNewestProduct();
  Future<Either<Failure, List<ProductModel>>> fetchcategories();
}
