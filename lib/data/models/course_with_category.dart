import 'package:flutter_course/data/models/course.dart';

class CourseWithCategory {
  String category;
  List<Course> courses;

  CourseWithCategory({required this.category, required this.courses});

  static CourseWithCategory fromMap(Map<String, dynamic> data) => CourseWithCategory(
        category: data.keys.first,
        courses: data[data.keys.first].map(
          (course) => Course.fromMap(course),
        ),
      );

  static CourseWithCategory fromKeyValue(String category, List<dynamic> courses) => CourseWithCategory(
        category: category,
        courses: courses
            .map(
              (course) => Course.fromMap(course),
            )
            .toList(),
      );
}
