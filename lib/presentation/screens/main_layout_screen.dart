import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/presentation/screens/tabs/favourite_tab.dart';
import 'package:evently/presentation/screens/tabs/home_tab.dart';
import 'package:evently/presentation/screens/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import '../view/custom_bottombar.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), FavouriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: CustomBottomBar(
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addEventScreen);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
