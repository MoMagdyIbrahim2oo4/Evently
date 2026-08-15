import 'package:evently/core/constants/app_icons.dart';
import 'package:evently/core/providers/app_theme_provider.dart';
import 'package:evently/core/utils/firebase_utils.dart';
import 'package:evently/core/utils/toast_utils.dart';
import 'package:evently/data/model/event.dart';
import 'package:evently/presentation/widgets/date_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:evently/core/providers/auth_provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(10.r),
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        title: Text(
          "Event details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(4.r),
              minimumSize: Size(30.w, 30.h),
              maximumSize: Size(30.w, 30.h),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: SvgPicture.asset(
              AppIcons.edit,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 20.w),

          OutlinedButton(
            onPressed: () {
              FirebaseUtils.deleteEvent(
                context.read<AuthProvider>().currentUser!.id,
                event,
              );
              ToastUtils.showToast(
                  msg: "Event deleted successfully",
                  gravity: ToastGravity.CENTER,
                  backColor: Colors.green,
                  textColor: Colors.white
              );
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(4.r),
              minimumSize: Size(30.w, 30.h),
              maximumSize: Size(30.w, 30.h),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: SvgPicture.asset(AppIcons.trash, width: 24.w, height: 24.h),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 16.h,
          children: [
            Container(
              width: double.infinity,
              height: 195.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(16.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    themeProvider.isDark
                        ? event.imagePathDark
                        : event.imagePathLight,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            DateDetails(dateTime: event.eventDate),
            Text("Description", style: Theme.of(context).textTheme.bodyMedium),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadiusGeometry.circular(16.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              child: Text(
                event.description,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
