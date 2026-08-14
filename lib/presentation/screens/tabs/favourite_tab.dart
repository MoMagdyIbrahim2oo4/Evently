import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../view/event_card.dart';
import '../../widgets/custom_text_form_field.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          spacing: 16.r,
          children: [
            CustomTextFormField(
              hint: "Search for event",
              suffixIcon: Icons.search_outlined,
            ),
            // Expanded(
            //   child: ListView.separated(
            //       itemBuilder: (context, index) => EventCard(),
            //       separatorBuilder: (context, index) =>
            //           SizedBox(height: 16.h,),
            //       itemCount: 10
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
