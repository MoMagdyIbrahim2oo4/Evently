import 'package:evently/data/model/event_type.dart';
import 'package:evently/presentation/view/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<EventType> categories = EventType.getCategories();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: DefaultTabController(
          length: categories.length,
          child: Column(
              children: [
                HomeHeader(categories: categories,),
                Expanded(
                  child: TabBarView(children: [
                    for(final category in categories)
                      Text(category.type)
                  ]
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
