import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/presentation/view/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(children: [HomeHeader()]),
      ),
    );
  }
}
