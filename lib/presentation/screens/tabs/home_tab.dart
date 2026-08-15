import 'package:evently/core/providers/auth_provider.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/firebase_utils.dart';
import 'package:evently/data/model/event_type.dart';
import 'package:evently/presentation/view/event_card.dart';
import 'package:evently/presentation/view/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

import '../../../data/model/event.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;
  List<Event> eventList = [];
  late Stream<List<Event>> eventStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventStream = updateEvent(currentIndex);
  }

  Stream<List<Event>> updateEvent(int index) {
    if (index == 0) {
      return FirebaseUtils.getEvents(
        context.read<AuthProvider>().currentUser!.id,
      );
    } else {
      return FirebaseUtils.getFilteredEvents(
        context.read<AuthProvider>().currentUser!.id,
        index,
      );
    }
  }

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
              HomeHeader(
                categories: categories,
                onTapPressed: (index) {
                  setState(() {
                    currentIndex = index;
                    eventStream = updateEvent(index);
                  });
                },
              ),
              Expanded(
                child: StreamBuilder<List<Event>>(
                  stream: eventStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text("No Events added yet"));
                    } else {
                      eventList = snapshot.data!;
                      return ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.detailsScreen,
                              arguments: eventList[index],
                            );
                          },
                          child: EventCard(event: eventList[index]),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemCount: eventList.length,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.separated(
// itemBuilder: (context, index) => EventCard(),
// separatorBuilder: (context, index) =>
// SizedBox(height: 16.h,),
// itemCount: 10
// )
