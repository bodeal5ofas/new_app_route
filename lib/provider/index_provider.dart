import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  int currentIndex = 0;
  updateIndex({required int newIndex}) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
