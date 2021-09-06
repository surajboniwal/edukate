import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_course/core/dio_provider.dart';
import 'package:flutter_course/data/models/course_with_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseRepository {
  CourseRepository(this.read);
  Reader read;

  static final provider = Provider<CourseRepository>((ref) => CourseRepository(ref.read));

  Future<List<CourseWithCategory>> fetchCourses() async {
    Response response = await read(dioProvider).get('course.json');
    List<CourseWithCategory> courses = [];
    jsonDecode(response.data).forEach((key, value) {
      courses.add(CourseWithCategory.fromKeyValue(key, value));
    });

    return courses;
  }
}
