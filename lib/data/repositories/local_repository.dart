import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalRepository {
  static final provider = Provider<LocalRepository>((ref) => LocalRepository());

  static initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<Course>(CourseAdapter());

    await Hive.openBox<Course>(Course.boxKey);
  }

  Future<void> addCourse(Course course) async {
    final courseBox = Hive.box<Course>(Course.boxKey);
    return await courseBox.put(course.id, course);
  }

  Future<void> removeCourse(String id) async {
    final courseBox = Hive.box<Course>(Course.boxKey);
    await courseBox.delete(id);
  }

  Future<List<Course>> getCourses() async {
    final courseBox = Hive.box<Course>(Course.boxKey);
    return courseBox.values.toList();
  }

  bool contains(String id) {
    final courseBox = Hive.box<Course>(Course.boxKey);
    return courseBox.containsKey(id);
  }
}
