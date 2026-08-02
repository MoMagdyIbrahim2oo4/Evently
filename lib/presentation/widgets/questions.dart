import 'package:flutter/material.dart';

import 'custom_text_button.dart';

class Questions extends StatelessWidget {
  String question;
  String buttonLabel;
  void Function() onpressed;

  Questions({
    super.key,
    required this.question,
    required this.buttonLabel,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(question, style: Theme.of(context).textTheme.bodySmall),
        CustomTextButton(
          label: buttonLabel,
          onpressed: onpressed,
          underlined: true,
        ),
      ],
    );
  }
}
