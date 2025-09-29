part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  const CartLoaded(this.items);

  @override
  List<Object?> get props => [items];

  bool contains(ProductModel product) {
    return items.any((item) => item.product.id == product.id);
  }
}

class CartError extends CartState {
  final String message;
  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
