import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course/ui/values/values.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: AppColors.lightGreyColor,
                blurRadius: 8.0,
              ),
            ],
          ),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                'https://github.githubassets.com/images/icons/emoji/unicode/1f3d${Random().nextInt(9)}.png',
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          title.split(' ')[0],
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
