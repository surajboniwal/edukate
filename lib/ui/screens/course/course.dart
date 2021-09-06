import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/course.dart';
import 'package:flutter_course/ui/values/values.dart';
import 'package:flutter_course/ui/widgets/widgets.dart';

import 'widgets/video_tile.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details',
        back: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.0),
                      Container(
                        height: 220.0,
                        child: Hero(
                          tag: course.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: CachedNetworkImage(
                              imageUrl: course.thumbnail,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18.0),
                      Text(
                        course.title,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentColor,
                        ),
                      ),
                      SizedBox(height: 16.0),
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
                      SizedBox(height: 12.0),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.whiteColor,
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            '${course.videos} Videos',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: course.videos,
                        itemBuilder: (context, index) => VideoTile(index: index, course: course),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 74),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(12.0),
              width: double.maxFinite,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: AppColors.accentColor,
                ),
                child: Text('Enroll'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
