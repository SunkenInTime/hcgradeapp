import 'package:flutter/material.dart';

import '../../constants/const.dart';

class MiddleSchoolSemesterCourseProvider with ChangeNotifier {
  List<String?> _semesterValues = ["A", "A"];
  String _letterGrade = "A";
  bool isCalculated = true;

  List<String?> get semesterValues => _semesterValues;
  String get letterGrade => _letterGrade;

  void CalculateGrade() {
    int quater1 = letterToNum(semesterValues[0]!);
    int quater2 = letterToNum(semesterValues[1]!);
    int calc = quater1 + quater2;
    double ans = calc / 2;
    _letterGrade = numToLetter(ans);
    isCalculated = true;
    notifyListeners();
  }

  void resetGrade() {
    _semesterValues = ["A", "A"];
    CalculateGrade();
  }

  void ChangeGrade(int index, String? value) {
    _semesterValues[index] = value;
    isCalculated = false;
    notifyListeners();
  }
}
