import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/providers/auth_provider.dart';
import 'package:evently/core/utils/firebase_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

import '../../../data/model/event.dart';
import '../../view/event_card.dart';
import '../../widgets/custom_text_form_field.dart';

class FavouriteTab extends StatefulWidget {
  FavouriteTab({super.key});

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  late Stream<List<Event>> favouriteStream;
  List<Event> favouriteList = [];
  List<Event> filteredFavouriteList = [];
  String searchText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favouriteStream = FirebaseUtils.getFavouriteEvents(
      context.read<AuthProvider>().currentUser!.id,
    );
  }

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
              onchanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            Expanded(
              child: StreamBuilder<List<Event>>(
                stream: favouriteStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No Events added yet"));
                  } else {
                    favouriteList = snapshot.data!;
                    filteredFavouriteList = favouriteList.where((event) {
                      return event.title.toLowerCase().contains(
                        searchText.toLowerCase(),
                      );
                    }).toList();
                    return ListView.separated(
                      itemBuilder: (context, index) =>
                          EventCard(event: filteredFavouriteList[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemCount: filteredFavouriteList.length,
                    );
                  }
                },
              ),
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
