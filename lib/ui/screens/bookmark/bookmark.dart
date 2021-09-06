import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/data/providers/localstorage_provider.dart';
import 'package:flutter_course/ui/values/values.dart';
import 'package:flutter_course/ui/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bookmarks',
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: Consumer(
          builder: (context, watch, child) {
            final List<Course>? courses = watch(LocalStorageProvider.provider);

            if (courses == null) {
              return Center(child: CircularProgressIndicator(color: AppColors.accentColor));
            }

            if (courses.length == 0) {
              return Center(
                child: Text(
                  'No bookmarks',
                  style: TextStyle(
                    color: AppColors.accentColor,
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: courses.length,
                      itemBuilder: (context, index) => CourseCard(
                        course: courses[index],
                        last: index + 1 == courses.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
