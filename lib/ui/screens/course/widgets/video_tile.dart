import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/ui/values/colors.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({
    Key? key,
    required this.course,
    required this.index,
  }) : super(key: key);

  final Course course;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.lightGreyColor,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: course.thumbnail,
            ),
          ),
          SizedBox(width: 18.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${index + 1}. Video title',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  '${Random().nextInt(45) + 1} mins',
                  style: TextStyle(
                    fontSize: 11.0,
                    color: AppColors.greyColor,
                  ),
                ),
                Container(
                  height: 4.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.accentColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 18.0),
          Icon(
            Icons.play_circle_outline,
            color: AppColors.accentColor,
            size: 36.0,
          ),
        ],
      ),
    );
  }
}
