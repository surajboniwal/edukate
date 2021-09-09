import 'dart:math';

import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/data/models/course_with_category.dart';
import 'package:flutter_course/data/repositories/course_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseProvider extends StateNotifier<List<CourseWithCategory>?> {
  CourseProvider(this.read) : super(null) {
    getCourses();
  }

  Reader read;

  static final provider = StateNotifierProvider<CourseProvider, List<CourseWithCategory>?>((ref) => CourseProvider(ref.read));

  static int selectedIndex = 0;

  int? randomCourseIndex;

  void getCourses() async {
    List<CourseWithCategory> courses = await read(CourseRepository.provider).fetchCourses();
    state = courses;
    read(SelectedCourseProvider.provider.notifier).setSelectedCourses(state![0].courses);
    if (randomCourseIndex == null) {
      randomCourseIndex = Random().nextInt(courses.length);
    }
  }

  CourseWithCategory get randomCourse => state![randomCourseIndex ?? 0];

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    state = state;
    read(SelectedCourseProvider.provider.notifier).setSelectedCourses(state![selectedIndex].courses);
  }

  bool isSelected(int index) => selectedIndex == index;
}

class SelectedCourseProvider extends StateNotifier<List<Course>> {
  SelectedCourseProvider(this.read) : super([]);

  Reader read;

  static final provider = StateNotifierProvider<SelectedCourseProvider, List<Course>>((ref) => SelectedCourseProvider(ref.read));

  void setSelectedCourses(List<Course> courses) => state = courses;
}
