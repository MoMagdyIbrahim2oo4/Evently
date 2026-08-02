import 'package:evently/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Validator validator;
  final int lines;
  bool? isObscured;
  String? obsecureChar;
  IconData prefIcon;
  String hint;
  IconData? suffixIcon;
  Function()? suffixPressed;

  CustomTextFormField({
    super.key,
    this.controller,
    required this.validator,
    this.lines = 1,
    this.isObscured,
    this.obsecureChar,
    required this.prefIcon,
    required this.hint,
    this.suffixIcon,
    this.suffixPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: lines,
      obscureText: isObscured == null ? false : isObscured!,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          prefixIcon: Icon(prefIcon),
          prefixIconColor: AppColors.comfortGray,
          hintText: hint,
          hintStyle: Theme
              .of(context)
              .textTheme
              .labelSmall,
          suffixIcon: suffixIcon == null ? null : IconButton(
              onPressed: suffixPressed, icon: Icon(suffixIcon))
      ),
    );
  }
}
