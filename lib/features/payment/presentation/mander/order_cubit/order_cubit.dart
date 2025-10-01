import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/cart/data/models/cart_model.dart';
import 'package:unique_supplement/features/payment/data/order_service.dart';
import 'package:unique_supplement/features/profiel/data/models/user_info_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderService orderService;

  OrderCubit(this.orderService) : super(OrderInitial());

  Future<void> createOrder(
    UserModel user,
    List<CartItemModel> cartItems,
  ) async {
    emit(OrderLoading());
    try {
      double totalAmount = 0;
      for (var item in cartItems) {
        final price = double.tryParse(item.product.price) ?? 0;
        totalAmount += (price * item.quantity);
      }

      print('💰 Total Amount: $totalAmount');

      final orderId = await orderService.createOrder(
        user: user,
        cartItems: cartItems,
      );

      emit(OrderSuccess(orderId, totalAmount));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
