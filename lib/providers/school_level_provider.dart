import 'package:flutter/material.dart';

class SchoolLevelProvider with ChangeNotifier {
  String _schoolLevel = "highschool";
  String get schoolLevel => _schoolLevel;

  void ChangeLevel(String level) {
    _schoolLevel = level;
    notifyListeners();
  }
}
