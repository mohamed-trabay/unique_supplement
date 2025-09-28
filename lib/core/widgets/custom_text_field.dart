import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/core/utiles/app_colors.dart';
import 'package:unique_supplement/features/search/presentation/views/manger/search_cubit/search_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'بحث',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: AppColors.background(context),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
      ),
      onChanged: (value) {
        context.read<SearchCubit>().search(value);
      },
    );
  }
}
