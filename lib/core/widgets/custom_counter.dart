import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 35.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.add, size: 22),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),

          Text(
            '$count',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),

          IconButton(
            icon: const Icon(Icons.remove, size: 22),
            onPressed: () {
              setState(() {
                if (count > 1) count--;
              });
            },
          ),
        ],
      ),
    );
  }
}
