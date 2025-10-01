import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/payment/data/order_service.dart';
import 'package:unique_supplement/features/payment/presentation/mander/paymob_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:unique_supplement/core/utiles/api_keys.dart';

class PaymentPage extends StatefulWidget {
  final double amount;
  final String orderId;
  final bool useWallet;

  const PaymentPage({
    super.key,
    required this.amount,
    required this.orderId,
    this.useWallet = false,
    required String iframeUrl,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? iframeUrl;
  late final WebViewController _webViewController;
  final OrderService _orderService = OrderService();

  @override
  void initState() {
    super.initState();
    _initPayment();
  }

  Future<void> _initPayment() async {
    try {
      final manager = PaymobManager();

      final integrationId =
          widget.useWallet
              ? ApiKeys.integrationIdWallet
              : ApiKeys.integrationIdCard;

      final paymentKey = await manager.getPaymentKey(
        amount: widget.amount,
        integrationId: integrationId,
        orderId: widget.orderId,
      );

      setState(() {
        iframeUrl = manager.buildIframeUrl(paymentKey);
        _webViewController =
            WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onNavigationRequest: (NavigationRequest request) {
                    if (request.url.contains('success=true')) {
                      _handlePaymentSuccess();
                      return NavigationDecision.prevent;
                    }

                    if (request.url.contains('success=false')) {
                      _handlePaymentFailure();
                      return NavigationDecision.prevent;
                    }

                    return NavigationDecision.navigate;
                  },
                  onPageFinished: (String url) {},
                ),
              )
              ..loadRequest(Uri.parse(iframeUrl!));
      });
    } catch (e) {
      debugPrint('Payment init error: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('فشل بدء الدفع: $e')));
      }
    }
  }

  Future<void> _handlePaymentSuccess() async {
    try {
      await _orderService.updateOrderStatus(
        orderId: int.parse(widget.orderId),
        status: 'processing',
      );

      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              title: const Text('✅ تم الدفع بنجاح'),
              content: Text('تم الدفع بنجاح!\nرقم الطلب: ${widget.orderId}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    context.read<CartCubit>().clearCart();
                  },
                  child: const Text('حسناً'),
                ),
              ],
            ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم الدفع لكن فشل تحديث حالة الطلب')),
      );
    }
  }

  Future<void> _handlePaymentFailure() async {
    try {
      await _orderService.updateOrderStatus(
        orderId: int.parse(widget.orderId),
        status: 'failed',
      );
    } catch (e) {}

    if (!mounted) return;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('❌ فشل الدفع'),
            content: const Text('فشلت عملية الدفع. يرجى المحاولة مرة أخرى.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('حسناً'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحة الدفع'), centerTitle: true),
      body:
          iframeUrl == null
              ? const Center(child: CircularProgressIndicator())
              : WebViewWidget(controller: _webViewController),
    );
  }
}
