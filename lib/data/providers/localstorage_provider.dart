import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/data/repositories/local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalStorageProvider extends StateNotifier<List<Course>?> {
  LocalStorageProvider(this.read) : super(null) {
    getCourses();
  }

  Reader read;

  static final provider = StateNotifierProvider<LocalStorageProvider, List<Course>?>((ref) => LocalStorageProvider(ref.read));

  void getCourses() async {
    List<Course> courses = await read(LocalRepository.provider).getCourses();
    state = courses;
  }

  void toggleCourse(Course course) async {
    if (contains(course.id)) {
      removeCourse(course.id);
    } else {
      addCourse(course);
    }
    getCourses();
  }

  bool contains(String id) {
    return read(LocalRepository.provider).contains(id);
  }

  void addCourse(Course course) async {
    await read(LocalRepository.provider).addCourse(course);
  }

  void removeCourse(String id) async {
    await read(LocalRepository.provider).removeCourse(id);
  }
}
