import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  String label;
  void Function() onpressed;

  MyElevatedButton({super.key, required this.label, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(label, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
