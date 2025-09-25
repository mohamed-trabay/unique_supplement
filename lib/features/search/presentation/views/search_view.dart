import 'package:flutter/material.dart';
import 'package:unique_supplement/features/search/presentation/views/widgetas/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SearchViewBody()));
  }
}
