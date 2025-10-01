import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unique_supplement/core/utiles/api_keys.dart';

class PaymobManager {
  final String baseUrl = 'https://accept.paymob.com/api';

  Future<String> _getAuthToken() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/tokens'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'api_key': ApiKeys.paymobApiKey}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        if (responseData['token'] != null) {
          return responseData['token'];
        } else {
          throw Exception('Token not found in response: ${response.body}');
        }
      } else {
        throw Exception(
          'Auth failed with status ${response.statusCode}: ${response.body}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> _registerOrder({
    required String authToken,
    required double amount,
    required String orderId,
    String currency = 'EGP',
  }) async {
    try {
      // إضافة timestamp للـ Order ID عشان يكون unique
      final uniqueOrderId = '$orderId-${DateTime.now().millisecondsSinceEpoch}';

      final response = await http.post(
        Uri.parse('$baseUrl/ecommerce/orders'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'auth_token': authToken,
          'delivery_needed': 'false',
          'amount_cents': (amount * 100).toInt().toString(),
          'currency': currency,
          'merchant_order_id': uniqueOrderId,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        if (responseData['id'] != null) {
          return responseData['id'];
        } else {
          throw Exception('Order ID not found in response: ${response.body}');
        }
      } else {
        throw Exception(
          'Order registration failed with status ${response.statusCode}: ${response.body}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPaymentKey({
    required double amount,
    required int integrationId,
    required String orderId,
    String currency = 'EGP',
  }) async {
    try {
      final authToken = await _getAuthToken();

      final paymobOrderId = await _registerOrder(
        authToken: authToken,
        amount: amount,
        orderId: orderId,
        currency: currency,
      );

      // 3. Get Payment Key
      final response = await http.post(
        Uri.parse('$baseUrl/acceptance/payment_keys'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'auth_token': authToken,
          'amount_cents': (amount * 100).toInt().toString(),
          'expiration': 3600,
          'order_id': paymobOrderId.toString(),
          'billing_data': {
            'apartment': 'NA',
            'email': 'test@test.com',
            'floor': 'NA',
            'first_name': 'NA',
            'street': 'NA',
            'building': 'NA',
            'phone_number': 'NA',
            'shipping_method': 'NA',
            'postal_code': 'NA',
            'city': 'NA',
            'country': 'NA',
            'last_name': 'NA',
            'state': 'NA',
          },
          'currency': currency,
          'integration_id': integrationId,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        if (responseData['token'] != null) {
          return responseData['token'];
        } else {
          throw Exception(
            'Payment key not found in response: ${response.body}',
          );
        }
      } else {
        throw Exception(
          'Payment key request failed with status ${response.statusCode}: ${response.body}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  String buildIframeUrl(String paymentKey) {
    final url =
        'https://accept.paymob.com/api/acceptance/iframes/${ApiKeys.iframeId}?payment_token=$paymentKey';
    return url;
  }
}
