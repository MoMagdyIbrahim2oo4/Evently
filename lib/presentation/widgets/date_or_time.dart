import 'package:evently/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class DateOrTime extends StatelessWidget {
  final IconData dateOrTimeIcon;
  final String title;
  final String buttonLabel;
  final VoidCallback onpressed;

  DateOrTime({
    super.key,
    required this.dateOrTimeIcon,
    required this.title,
    required this.buttonLabel,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Icon(dateOrTimeIcon, color: Theme.of(context).colorScheme.primary),
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        Spacer(),
        CustomTextButton(
          label: buttonLabel,
          onpressed: onpressed,
          underlined: true,
        ),
      ],
    );
  }
}
