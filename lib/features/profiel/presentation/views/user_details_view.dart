import 'package:flutter/material.dart';
import 'package:unique_supplement/features/profiel/presentation/views/widgets/user_details_view_body.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: UserDetailsViewBody()));
  }
}
