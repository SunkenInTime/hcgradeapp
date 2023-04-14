import 'package:flutter/material.dart';

import '../constants/const.dart';

class CourseCalculatorProvider with ChangeNotifier {
  List<String?> _quarterValues = ["A", "A", "A", "A", "A", "A"];
  String _letterGrade = "A";

  String get letterGrade => _letterGrade;
  List<String?> get quarterValues => _quarterValues;

  void resetGrade() {
    _quarterValues = ["A", "A", "A", "A", "A", "A"];
    CalculateGrade();
    notifyListeners();
  }

  void CalculateGrade() {
    int quater1 = letterToNum(_quarterValues[0]!) * 2;
    int quater2 = letterToNum(_quarterValues[1]!) * 2;
    int quater3 = letterToNum(_quarterValues[2]!) * 2;
    int quater4 = letterToNum(_quarterValues[3]!) * 2;
    int midterm = letterToNum(_quarterValues[4]!) * 1;
    int finals = letterToNum(_quarterValues[5]!) * 1;
    int calc = quater1 + quater2 + quater3 + quater4 + midterm + finals;
    double ans = calc / 10;
    _letterGrade = numToLetter(ans);
    notifyListeners();
  }

  void ChangeGrade(int index, String? value) {
    _quarterValues[index] = value;
    // CalculateGrade();
    notifyListeners();
  }
}
