import 'package:flutter/material.dart';
import 'package:flutter_course/ui/screens/navigation/navigation_notifier.dart';
import 'package:flutter_course/ui/screens/screens.dart';
import 'package:flutter_course/ui/values/values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  static const List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    BookmarkScreen(),
    // Center(child: Text('Chat')),
    // Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              color: AppColors.lightGreyColor,
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavItem(index: 0, icon: Icons.home_outlined),
            BottomNavItem(index: 2, icon: Icons.explore_outlined),
            BottomNavItem(index: 1, icon: Icons.bookmark_outline),
            // BottomNavItem(index: 3, icon: Icons.chat_bubble_outline),
            // BottomNavItem(index: 4, icon: Icons.settings_outlined),
          ],
        ),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final index = watch(NavigationNotifer.navigationState);
          return screens[index];
        },
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);

  final int index;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final navigationNotifier = watch(NavigationNotifer.navigationState.notifier);
        final navigationState = watch(NavigationNotifer.navigationState);
        return GestureDetector(
          onTap: () {
            navigationNotifier.change(index);
          },
          child: CircleAvatar(
            radius: 24.0,
            backgroundColor: navigationState == index ? AppColors.accentColor : AppColors.whiteColor,
            child: Icon(
              icon,
              color: navigationState == index ? AppColors.whiteColor : AppColors.accentColor,
            ),
          ),
        );
      },
    );
  }
}
