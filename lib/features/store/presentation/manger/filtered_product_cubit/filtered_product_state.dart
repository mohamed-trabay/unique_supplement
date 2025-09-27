part of 'filtered_product_cubit.dart';

sealed class FilteredProductState extends Equatable {
  const FilteredProductState();

  @override
  List<Object> get props => [];
}

final class FilteredProductInitial extends FilteredProductState {}

class FilteredProductsLoading extends FilteredProductState {}

class FilteredProductsSuccess extends FilteredProductState {
  final List<ProductModel> products;
  const FilteredProductsSuccess(this.products);
}

class FilteredProductsFailure extends FilteredProductState {
  final String errMessage;
  const FilteredProductsFailure(this.errMessage);
}
