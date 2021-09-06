import 'package:hive/hive.dart';

part 'course.g.dart';

@HiveType(typeId: 0)
class Course extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String thumbnail;
  @HiveField(3)
  int videos;
  @HiveField(4)
  int hours;
  @HiveField(5)
  int articles;
  @HiveField(6)
  double rating;

  Course({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.videos,
    required this.hours,
    required this.articles,
    required this.rating,
  });

  static final String boxKey = 'course_box';

  static Course fromMap(Map<String, dynamic> data) => Course(
        id: data['id'],
        title: data['title'],
        thumbnail: data['thumbnail'],
        videos: data['videos'],
        hours: data['hours'],
        articles: data['articles'],
        rating: data['rating'],
      );
}
