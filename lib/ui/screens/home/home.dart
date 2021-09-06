import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/data/models/course_with_category.dart';
import 'package:flutter_course/data/providers/course_provider.dart';
import 'package:flutter_course/ui/values/colors.dart';
import 'package:flutter_course/ui/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/category_icon.dart';
import 'widgets/ongoingcourse_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const IconData selectedIcon = Icons.home;
  static const IconData unselectedIcon = Icons.home_outlined;
  static const String label = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(),
                SizedBox(height: 36.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ongoing Course',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'SEE ALL',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Text(
                  '12 Enrolled Courses',
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 7,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Consumer(
                builder: (context, watch, child) {
                  final List<Course> courses = watch(CourseProvider.provider)![0].courses;
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: courses.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => OngoingCourseCard(
                      isLast: index == courses.length - 1,
                      course: courses[index],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 36.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Categories',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'SEE ALL',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Consumer(
                  builder: (context, watch, child) {
                    List<CourseWithCategory> courses = watch(CourseProvider.provider)!.getRange(0, 4).toList();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: courses.map((course) => Expanded(child: CategoryIcon(title: course.category))).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
