part of 'order_cubit.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final int orderId;
  final double totalAmount;

  OrderSuccess(this.orderId, this.totalAmount);
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}
