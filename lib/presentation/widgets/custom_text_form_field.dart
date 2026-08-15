import 'package:evently/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Validator? validator;
  final int lines;
  bool? isObscured;
  String? obsecureChar;
  IconData? prefIcon;
  String? hint;
  IconData? suffixIcon;
  Function()? suffixPressed;
  void Function(String)? onchanged;
  bool? enable;

  CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.lines = 1,
    this.isObscured,
    this.obsecureChar,
    this.prefIcon,
    this.hint,
    this.suffixIcon,
    this.suffixPressed,
    this.onchanged,
    this.enable
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      style: Theme.of(context).textTheme.labelSmall,
      controller: controller,
      onChanged: onchanged,
      validator: validator,
      maxLines: lines,
      obscureText: isObscured == null ? false : isObscured!,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        prefixIcon: prefIcon == null ? null : Icon(prefIcon),
        prefixIconColor: AppColors.comfortGray,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon)),
      ),
    );
  }
}
