import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unique_supplement/core/utiles/api_keys.dart';
import 'package:unique_supplement/features/cart/data/models/cart_model.dart';
import 'package:unique_supplement/features/profiel/data/models/user_info_model.dart';

class OrderService {
  final String baseUrl = ApiKeys.baseUrl;
  final String consumerKey = ApiKeys.consumerKey;
  final String consumerSecret = ApiKeys.consumerSecret;

  Future<int> createOrder({
    required UserModel user,
    required List<CartItemModel> cartItems,
  }) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}';

    final url = Uri.parse('$baseUrl/orders');

    final orderData = {
      'payment_method': 'paymob',
      'payment_method_title': 'Paymob Payment',
      'set_paid': false,
      'status': 'pending',
      'billing': {
        'first_name': user.firstName,
        'last_name': user.lastName,
        'address_1': user.address,
        'city': user.city,
        'country': user.country,
        'email': user.email,
        'phone': user.phone,
      },
      'shipping': {
        'first_name': user.firstName,
        'last_name': user.lastName,
        'address_1':
            '${user.street}, ${user.building}, ${user.floor}, ${user.apartment}',
        'city': user.city,
        'country': user.country,
      },
      'line_items':
          cartItems.map((item) {
            return {'product_id': item.product.id, 'quantity': item.quantity};
          }).toList(),
    };

    try {
      final response = await http
          .post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': basicAuth,
            },
            body: jsonEncode(orderData),
          )
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        return body['id'];
      } else {
        throw Exception('Failed to create order: ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateOrderStatus({
    required int orderId,
    required String status,
    String? transactionId,
  }) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}';

    final url = Uri.parse('$baseUrl/orders/$orderId');

    final updateData = {
      'status': status,
      'set_paid': status == 'processing' || status == 'completed',
      if (transactionId != null) 'transaction_id': transactionId,
    };

    try {
      final response = await http
          .put(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': basicAuth,
            },
            body: jsonEncode(updateData),
          )
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to update order: ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
