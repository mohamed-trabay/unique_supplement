import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

// ignore: must_be_immutable
class CartItemModel extends Equatable {
  final ProductModel product;
  int quantity;
  final String? selectedOption;

  CartItemModel({
    required this.product,
    required this.quantity,
    this.selectedOption,
  });

  Map<String, dynamic> toMap() => {
    'product': product.toJson(),
    'quantity': quantity,
    'selectedOption': selectedOption,
  };

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'quantity': quantity,
    'selectedOption': selectedOption,
  };

  factory CartItemModel.fromMap(Map<String, dynamic> map) => CartItemModel(
    product: ProductModel.fromJson(map['product']),
    quantity: map['quantity'],
    selectedOption: map['selectedOption'],
  );

  factory CartItemModel.fromJson(Map<String, dynamic> map) => CartItemModel(
    product: ProductModel.fromJson(map['product']),
    quantity: map['quantity'],
    selectedOption: map['selectedOption'],
  );

  static String encodeList(List<CartItemModel> items) =>
      jsonEncode(items.map((item) => item.toMap()).toList());

  static List<CartItemModel> decodeList(String source) =>
      (jsonDecode(source) as List)
          .map((item) => CartItemModel.fromMap(item))
          .toList();

  double get totalPrice {
    final price = double.tryParse(product.price) ?? 0;
    return price * quantity;
  }

  @override
  List<Object?> get props => [product, quantity, selectedOption];
}
