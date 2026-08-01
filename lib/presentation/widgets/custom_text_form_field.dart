import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Validator validator;
  final int lines;
  bool? isObscured;
  String? obsecureChar;
  Widget? prefIcon;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.lines = 1,
    this.isObscured,
    this.obsecureChar,
    this.prefIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: lines,
      obscureText: isObscured == null ? false : isObscured!,
      obscuringCharacter: "*",
      decoration: InputDecoration(prefixIcon: prefIcon),
    );
  }
}
