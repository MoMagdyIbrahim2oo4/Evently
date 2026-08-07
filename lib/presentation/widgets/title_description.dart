import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../l10n/app_localizations.dart';

class TitleDescription extends StatelessWidget {
  String title;
  String description;

  TitleDescription({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 20.h,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
