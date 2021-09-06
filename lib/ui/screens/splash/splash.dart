import 'package:flutter/material.dart';
import 'package:flutter_course/data/providers/course_provider.dart';
import 'package:flutter_course/ui/screens/screens.dart';
import 'package:flutter_course/ui/values/values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            final courses = watch(CourseProvider.provider);
            if (courses != null) {
              Future.delayed(Duration.zero).then((_) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NavigationScreen()), (route) => false));
            }
            return CircularProgressIndicator(
              color: AppColors.accentColor,
            );
          },
        ),
      ),
    );
  }
}
