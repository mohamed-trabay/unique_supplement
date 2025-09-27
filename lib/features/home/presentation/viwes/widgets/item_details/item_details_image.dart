import 'package:flutter/material.dart';
import 'package:unique_supplement/core/widgets/fav_icon.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_item_image.dart';

class ItemDetailsImage extends StatelessWidget {
  const ItemDetailsImage({super.key, required this.imageURL});
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .14),
          child: CustomItemImage(imageURL: imageURL),
        ),
        Positioned(
          left: 0,
          top: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward, size: 28),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        // ignore: prefer_const_constructors
        Positioned(right: 0, top: 10, child: const FavIcon()),
      ],
    );
  }
}
