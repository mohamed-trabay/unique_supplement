import 'package:flutter/material.dart';
import 'package:unique_supplement/features/fav/presentation/views/widgets/fav_container.dart';

class FavList extends StatelessWidget {
  const FavList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const FavContainer();
      },
    );
  }
}
