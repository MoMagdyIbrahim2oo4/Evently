import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class SettingTile extends StatelessWidget {
  final String label;
  final Widget item;

  SettingTile({super.key, required this.label, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadiusGeometry.circular(16.r),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: ListTile(
        leading: Text(label, style: Theme.of(context).textTheme.titleSmall),
        trailing: item,
      ),
    );
  }
}
