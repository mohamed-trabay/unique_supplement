import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/api_keys.dart';
import 'package:unique_supplement/features/cart/data/models/cart_model.dart';
import 'package:unique_supplement/features/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_buttom.dart';
import 'package:unique_supplement/features/payment/presentation/mander/order_cubit/order_cubit.dart';
import 'package:unique_supplement/features/payment/presentation/mander/paymob_manager.dart';
import 'package:unique_supplement/features/payment/presentation/views/widgets/payment_page.dart';
import 'package:unique_supplement/features/profiel/data/models/user_info_model.dart';
import 'package:unique_supplement/features/profiel/presentation/manger/user_cubit/user_cubit.dart';
import 'package:unique_supplement/features/profiel/presentation/views/widgets/custom_text_form_field.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({super.key, required this.amount});
  final double amount;

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final whatsappController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final apartmentController = TextEditingController();
  final floorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final cubit = context.read<UserCubit>();
      await cubit.loadUser();
      final state = cubit.state;
      if (state is UserLoaded) {
        final user = state.user;
        setState(() {
          firstNameController.text = user.firstName;
          lastNameController.text = user.lastName;
          emailController.text = user.email;
          phoneController.text = user.phone;
          whatsappController.text = user.whatsapp;
          addressController.text = user.address;
          countryController.text = user.country;
          cityController.text = user.city;
          streetController.text = user.street;
          buildingController.text = user.building;
          apartmentController.text = user.apartment;
          floorController.text = user.floor;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) async {
        if (state is OrderLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is OrderSuccess) {
          Navigator.pop(context);

          final orderId = state.orderId.toString();
          final totalAmount = state.totalAmount;

          try {
            final paymentKey = await PaymobManager().getPaymentKey(
              amount: totalAmount,
              integrationId: ApiKeys.integrationIdCard,
              orderId: orderId,
            );

            final iframeUrl = PaymobManager().buildIframeUrl(paymentKey);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => PaymentPage(
                      iframeUrl: iframeUrl,
                      amount: totalAmount,
                      orderId: orderId,
                    ),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('خطأ في بدء الدفع: $e')));
          }
        } else if (state is OrderError) {
          Navigator.pop(context); // اقفل اللودينج
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطأ في إنشاء الطلب: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormTextField(
                label: 'الاسم الأول',
                controller: firstNameController,
                validator:
                    (v) => v == null || v.isEmpty ? 'ادخل الاسم الأول' : null,
              ),
              SizedBox(height: 20.h),
              FormTextField(
                label: 'الاسم الثاني',
                controller: lastNameController,
                validator:
                    (v) => v == null || v.isEmpty ? 'ادخل الاسم الثاني' : null,
              ),
              SizedBox(height: 20.h),
              FormTextField(
                label: 'البريد الإلكتروني',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'ادخل البريد الإلكتروني';
                  if (!v.contains('@')) return 'البريد الإلكتروني غير صالح';
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              FormTextField(
                label: 'رقم الهاتف',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v == null || v.isEmpty) return 'ادخل رقم الهاتف';
                  if (!RegExp(r'^05\d{8}$').hasMatch(v)) {
                    return 'رقم سعودي غير صالح الرقم يجب أن يبدأ بـ 05';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              FormTextField(
                label: 'رقم الواتساب',
                controller: whatsappController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v == null || v.isEmpty) return 'ادخل رقم الواتساب';
                  if (!RegExp(r'^05\d{8}$').hasMatch(v)) {
                    return 'رقم سعودي غير صالح الرقم يجب أن يبدأ بـ 05';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              FormTextField(
                label: 'العنوان',
                controller: addressController,
                validator:
                    (v) => v == null || v.isEmpty ? 'ادخل العنوان' : null,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: FormTextField(
                      label: 'الدولة',
                      controller: countryController,
                      validator:
                          (v) => v == null || v.isEmpty ? 'ادخل الدولة' : null,
                    ),
                  ),
                  SizedBox(width: 25.w),
                  Expanded(
                    child: FormTextField(
                      label: 'المدينة',
                      controller: cityController,
                      validator:
                          (v) => v == null || v.isEmpty ? 'ادخل المدينة' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: FormTextField(
                      label: 'اسم الشارع',
                      controller: streetController,
                      validator:
                          (v) =>
                              v == null || v.isEmpty ? 'ادخل اسم الشارع' : null,
                    ),
                  ),
                  SizedBox(width: 25.w),
                  Expanded(
                    child: FormTextField(
                      label: 'رقم المبنى',
                      controller: buildingController,
                      keyboardType: TextInputType.number,
                      validator:
                          (v) =>
                              v == null || v.isEmpty ? 'ادخل رقم المبنى' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: FormTextField(
                      label: 'رقم الشقة',
                      controller: apartmentController,
                      keyboardType: TextInputType.number,
                      validator:
                          (v) =>
                              v == null || v.isEmpty ? 'ادخل رقم الشقة' : null,
                    ),
                  ),
                  SizedBox(width: 25.w),
                  Expanded(
                    child: FormTextField(
                      label: 'رقم الدور',
                      controller: floorController,
                      keyboardType: TextInputType.number,
                      validator:
                          (v) =>
                              v == null || v.isEmpty ? 'ادخل رقم الدور' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              CustomButton(
                title: 'متابعة للدفع',
                height: 45.h,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final user = UserModel(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      whatsapp: whatsappController.text,
                      address: addressController.text,
                      country: countryController.text,
                      city: cityController.text,
                      street: streetController.text,
                      building: buildingController.text,
                      apartment: apartmentController.text,
                      floor: floorController.text,
                    );

                    context.read<UserCubit>().saveUser(user);

                    final cartItems =
                        (context.read<CartCubit>().state as CartLoaded).items
                            .cast<CartItemModel>();
                    context.read<OrderCubit>().createOrder(user, cartItems);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    whatsappController.dispose();
    addressController.dispose();
    countryController.dispose();
    cityController.dispose();
    streetController.dispose();
    buildingController.dispose();
    apartmentController.dispose();
    floorController.dispose();
    super.dispose();
  }
}
