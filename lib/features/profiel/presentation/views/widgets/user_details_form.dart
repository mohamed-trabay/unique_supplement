import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_buttom.dart';
import 'package:unique_supplement/features/profiel/presentation/views/widgets/custom_text_form_field.dart';

class UserDetailsForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UserDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FromTextField(
            label: 'الاسم الأول',
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'ادخل الاسم الأول' : null,
          ),
          SizedBox(height: 12.h),
          FromTextField(
            label: 'الاسم الثاني',
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'ادخل الاسم الثاني' : null,
          ),
          SizedBox(height: 12.h),
          FromTextField(
            label: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ادخل البريد الإلكتروني';
              }
              if (!value.contains('@')) {
                return 'البريد الإلكتروني غير صالح';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          FromTextField(
            label: 'رقم الهاتف',
            keyboardType: TextInputType.phone,
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'ادخل رقم الهاتف' : null,
          ),
          SizedBox(height: 12.h),
          const FromTextField(
            label: 'رقم الواتساب',
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 12.h),
          const FromTextField(label: 'العنوان'),
          SizedBox(height: 12.h),
          Row(
            children: [
              const Expanded(child: FromTextField(label: 'الدولة')),
              SizedBox(width: 12.w),
              const Expanded(child: FromTextField(label: 'المدينة')),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              const Expanded(child: FromTextField(label: 'اسم الشارع')),
              SizedBox(width: 12.w),
              const Expanded(
                child: const FromTextField(
                  label: 'رقم المبنى',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              const Expanded(
                child: FromTextField(
                  label: 'رقم الشقة',
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 12.w),
              const Expanded(
                child: FromTextField(
                  label: 'رقم الدور',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          CustomButton(
            title: 'متابعه للدفع',
            height: 45.h,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('البيانات صحيحة ✅')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
