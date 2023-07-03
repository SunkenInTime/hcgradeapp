import 'package:flutter/material.dart';

class SchoolLevelProvider with ChangeNotifier {
  String _schoolLevel = "highschool";
  bool _isHighSchool = true;
  String get schoolLevel => _schoolLevel;
  bool get isHighSchool => _isHighSchool;

  void ChangeLevel(String level) {
    _schoolLevel = level;
    if (level != "highschool") {
      _isHighSchool = false;
    } else {
      _isHighSchool = true;
    }
    notifyListeners();
  }
}
