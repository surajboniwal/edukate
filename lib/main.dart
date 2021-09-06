import 'package:flutter/material.dart';
import 'package:flutter_course/data/repositories/local_repository.dart';
import 'package:flutter_course/ui/screens/screens.dart';
import 'package:flutter_course/ui/values/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalRepository.initialize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edukate',
      navigatorKey: navigationKey,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
