import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/utiles/assets.dart';
import 'package:unique_supplement/features/home/presentation/viwes/widgets/custom_banner.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: const [
        CustomBanner(imagePath: AssetsData.bannar1),
        CustomBanner(imagePath: AssetsData.bannar2),
      ],
      options: CarouselOptions(
        height: 180.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
    );
  }
}
