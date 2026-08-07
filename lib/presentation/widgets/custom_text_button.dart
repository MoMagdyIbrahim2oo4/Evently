import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';

class CustomTextButton extends StatelessWidget {
  String label;
  void Function() onpressed;
  bool underlined;

  CustomTextButton({
    super.key,
    required this.label,
    required this.onpressed,
    this.underlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.lightBlue
            : AppColors.darkBlue,
        padding: EdgeInsets.zero,
        textStyle: underlined
            ? AppTextStyle.semiBold14Underlined
            : AppTextStyle.semiBold14,
      ),
      child: Text(label),
    );
  }
}
