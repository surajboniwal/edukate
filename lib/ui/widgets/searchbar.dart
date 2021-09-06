import 'package:flutter/material.dart';
import 'package:flutter_course/ui/values/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.hint = 'Enter your query here',
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(Icons.search, color: AppColors.greyColor),
          suffixIcon: Icon(Icons.mic, color: AppColors.accentColor),
        ),
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
