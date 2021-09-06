import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/ui/screens/course/course.dart';
import 'package:flutter_course/ui/values/values.dart';
import 'package:flutter_course/ui/widgets/widgets.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
    required this.last,
  }) : super(key: key);

  final Course course;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CourseScreen(course: course))),
      child: Container(
        height: 130.0,
        padding: EdgeInsets.all(18.0),
        margin: EdgeInsets.only(top: 12.0, bottom: last ? 18.0 : 0.0),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Hero(
              tag: course.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(imageUrl: course.thumbnail),
              ),
            ),
            SizedBox(width: 18.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    course.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 16.0,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '${course.hours}hrs',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Icon(
                        Icons.star,
                        size: 18.0,
                        color: AppColors.yellowColor,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '${course.rating}',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const Spacer(),
                      BookmarkButton(course: course),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
