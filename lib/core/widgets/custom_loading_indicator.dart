// import 'package:flutter/material.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';

// class CustomLoadingIndicator extends StatelessWidget {
//   final BorderRadius? borderRadius;
//   final double? aspecracio;

//   const CustomLoadingIndicator({super.key, this.borderRadius, this.aspecracio});

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: aspecracio ?? 1,
//       child: Shimmer(
//         duration: const Duration(seconds: 3),
//         interval: const Duration(seconds: 0),
//         color: Colors.white,
//         colorOpacity: 0.5,
//         enabled: true,
//         direction: const ShimmerDirection.fromLTRB(),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: borderRadius ?? BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
// }
