import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/data/models/course_with_category.dart';
import 'package:flutter_course/data/providers/course_provider.dart';
import 'package:flutter_course/ui/values/values.dart';
import 'package:flutter_course/ui/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/course_category_tile.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Courses',
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 60,
              floating: true,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: SearchBar(
                          hint: 'Search course',
                        )),
                        SizedBox(width: 18.0),
                        Container(
                          height: 50,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Icon(Icons.sort, color: AppColors.accentColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      SizedBox(height: 18.0),
                      Container(
                        height: 35.0,
                        child: Consumer(
                          builder: (context, watch, child) {
                            final List<CourseWithCategory>? coursesWithCategories = watch(CourseProvider.provider);
                            final courseProvider = watch(CourseProvider.provider.notifier);
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: coursesWithCategories?.length ?? 0,
                              itemBuilder: (context, index) => CourseCategoryTile(
                                selected: courseProvider.isSelected(index),
                                last: index == coursesWithCategories!.length - 1,
                                category: coursesWithCategories[index].category,
                                onTap: () {
                                  courseProvider.changeSelectedIndex(index);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Consumer(
                          builder: (context, watch, child) {
                            final List<Course> courses = watch(SelectedCourseProvider.provider);
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: courses.length,
                              itemBuilder: (context, index) => CourseCard(
                                course: courses[index],
                                last: index + 1 == courses.length,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
