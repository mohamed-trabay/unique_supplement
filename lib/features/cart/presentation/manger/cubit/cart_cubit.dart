import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/cart/data/models/cart_model.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/core/utiles/local_storage_service.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      final items = await LocalStorageService.loadCartItems();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> toggleCart(
    ProductModel product, {
    int quantity = 1,
    String? option,
  }) async {
    final items = await LocalStorageService.loadCartItems();

    final index = items.indexWhere((item) => item.product.id == product.id);

    if (index != -1) {
      items.removeAt(index);
    } else {
      items.add(
        CartItemModel(
          product: product,
          quantity: quantity,
          selectedOption: option,
        ),
      );
    }

    await LocalStorageService.saveCartItems(items);
    emit(CartLoaded(items));
  }

  Future<void> removeFromCart(int productId) async {
    final items = await LocalStorageService.loadCartItems();
    items.removeWhere((item) => item.product.id == productId);
    await LocalStorageService.saveCartItems(items);
    emit(CartLoaded(items));
  }

  Future<void> updateQuantity(CartItemModel item, int quantity) async {
    final items = await LocalStorageService.loadCartItems();
    final index = items.indexWhere((i) => i.product.id == item.product.id);
    if (index != -1) {
      items[index].quantity = quantity;
      await LocalStorageService.saveCartItems(items);
      emit(CartLoaded(items));
    }
  }

  Future<void> clearCart() async {
    await LocalStorageService.clearCart();
    emit(CartLoaded([]));
  }
}
