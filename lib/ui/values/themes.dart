import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Circular',
        scaffoldBackgroundColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          actionsIconTheme: IconThemeData(
            color: AppColors.accentColor,
          ),
          iconTheme: IconThemeData(
            color: AppColors.accentColor,
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
      );
}
