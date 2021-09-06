import 'package:flutter/material.dart';
import 'package:flutter_course/ui/values/values.dart';

class CourseCategoryTile extends StatelessWidget {
  const CourseCategoryTile({
    Key? key,
    this.last = false,
    required this.category,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final bool last;
  final bool selected;
  final String category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(18.0, 0, last ? 18.0 : 0, 0),
        decoration: BoxDecoration(
          color: selected ? AppColors.accentColor : AppColors.accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              category,
              style: TextStyle(
                color: selected ? AppColors.whiteColor : AppColors.accentColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
