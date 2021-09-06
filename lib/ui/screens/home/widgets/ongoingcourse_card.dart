import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/ui/values/colors.dart';

class OngoingCourseCard extends StatelessWidget {
  const OngoingCourseCard({
    Key? key,
    required this.isLast,
    required this.course,
  }) : super(key: key);

  final bool isLast;
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.fromLTRB(18.0, 0.0, isLast ? 18.0 : 0.0, 0.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: course.thumbnail,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 18.0),
                Expanded(
                  child: Text(
                    course.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 8.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 8.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.accentColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Container(
                    height: 8.0,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.yellowColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${course.videos} Video • ${course.hours} Hours • ${course.articles} Articles',
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
