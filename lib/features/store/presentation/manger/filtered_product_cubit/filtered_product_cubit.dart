import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/store/data/repo/store_repo_impl.dart';

part 'filtered_product_state.dart';

class FilteredProductCubit extends Cubit<FilteredProductState> {
  final StoreRepoImpl storerepo;
  FilteredProductCubit(this.storerepo) : super(FilteredProductInitial());

  void fetchFilteredProducts({
    bool? onSale,
    bool? inStock,
    String? sortBy,
    int? minPrice,
    int? maxPrice,
  }) async {
    emit(FilteredProductsLoading());

    final result = await storerepo.fetchFilteredProducts(
      onSale: onSale,
      inStock: inStock,
      sortBy: sortBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );

    result.fold(
      (failure) => emit(FilteredProductsFailure(failure.errMessage)),
      (products) => emit(FilteredProductsSuccess(products)),
    );
  }
}
