import 'package:flutter/material.dart';

class CustomItemImage extends StatelessWidget {
  const CustomItemImage({super.key, required this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: AspectRatio(aspectRatio: 2.6 / 4, child: Image.asset(imageURL)),
    );
  }
}
