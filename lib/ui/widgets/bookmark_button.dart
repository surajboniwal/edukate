import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/data/providers/localstorage_provider.dart';
import 'package:flutter_course/ui/values/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        watch(LocalStorageProvider.provider);
        final localStorageNotifer = watch(LocalStorageProvider.provider.notifier);
        return IconButton(
          onPressed: () {
            localStorageNotifer.toggleCourse(course);
          },
          icon: Icon(localStorageNotifer.contains(course.id) ? Icons.bookmark : Icons.bookmark_outline),
          color: AppColors.redColor,
        );
      },
    );
  }
}
