import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: 'https://gist.githubusercontent.com/surajboniwal/6f60bcf2eecafaddfd5cc45a23ff8db2/raw/6fd88e9853a120171fbd2c7fa2c64a8449565540/',
    ),
  ),
);
