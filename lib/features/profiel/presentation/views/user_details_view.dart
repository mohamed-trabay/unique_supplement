import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_supplement/features/profiel/presentation/manger/user_cubit/user_cubit.dart';
import 'package:unique_supplement/features/profiel/presentation/views/widgets/user_details_view_body.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => UserCubit()..loadUser(),
          child: const UserDetailsViewBody(),
        ),
      ),
    );
  }
}
