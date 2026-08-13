import 'package:evently/data/model/event_type.dart';
import 'package:evently/presentation/view/event_card.dart';
import 'package:evently/presentation/view/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    List<EventType> categories = EventType.getCategories(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: DefaultTabController(
          length: categories.length,
          child: Column(
              spacing: 16.h,
              children: [
                HomeHeader(categories: categories,),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => EventCard(),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h,),
                      itemCount: 10
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
