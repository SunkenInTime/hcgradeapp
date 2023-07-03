import 'package:flutter/material.dart';

import '../../constants/const.dart';

class SemesterCourseProvider with ChangeNotifier {
  List<String?> _semesterValues = ["A", "A", "A"];
  String _letterGrade = "A";
  bool isCalculated = true;

  List<String?> get semesterValues => _semesterValues;
  String get letterGrade => _letterGrade;

  void CalculateGrade() {
    int quater1 = letterToNum(semesterValues[0]!) * 2;
    int quater2 = letterToNum(semesterValues[1]!) * 2;
    int midterm = letterToNum(semesterValues[2]!) * 1;
    int calc = quater1 + quater2 + midterm;
    double ans = calc / 5;
    _letterGrade = numToLetter(ans);
    isCalculated = true;
    notifyListeners();
  }

  void resetGrade() {
    _semesterValues = ["A", "A", "A"];
    CalculateGrade();
  }

  void ChangeGrade(int index, String? value) {
    _semesterValues[index] = value;
    isCalculated = false;
    notifyListeners();
  }
}
