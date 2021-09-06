import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifer extends StateNotifier<int> {
  NavigationNotifer() : super(0);

  static final navigationState = StateNotifierProvider<NavigationNotifer, int>((ref) => NavigationNotifer());

  void change(int index) => state = index;
}
