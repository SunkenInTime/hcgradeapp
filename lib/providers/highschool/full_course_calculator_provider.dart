import 'package:flutter/material.dart';

import '../../constants/const.dart';

class CourseCalculatorProvider with ChangeNotifier {
  List<String?> _quarterValues = ["A", "A", "A", "A", "A", "A"];
  String _letterGrade = "A";
  bool isCalculated = true;

  String get letterGrade => _letterGrade;
  List<String?> get quarterValues => _quarterValues;

  void resetGrade() {
    _quarterValues = ["A", "A", "A", "A", "A", "A"];
    calculateGrade();
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void calculateGrade() {
    int quarter1 = letterToNum(_quarterValues[0]!) * 2;
    int quarter2 = letterToNum(_quarterValues[1]!) * 2;
    int quarter3 = letterToNum(_quarterValues[2]!) * 2;
    int quarter4 = letterToNum(_quarterValues[3]!) * 2;
    int midterm = letterToNum(_quarterValues[4]!) * 1;
    int finals = letterToNum(_quarterValues[5]!) * 1;
    int calc = quarter1 + quarter2 + quarter3 + quarter4 + midterm + finals;
    double ans = calc / 10;
    List<int> listOfQuaters = [quarter1, quarter2, quarter3, quarter4];
    for (int i = 0; i < 3; i++) {
      if (listOfQuaters[0] == 0 && listOfQuaters[1] == 0 ||
          listOfQuaters[2] == 0 && listOfQuaters[3] == 0) {
        _letterGrade = numToLetter(0);
        isCalculated = true;
        notifyListeners();
        return;
      }
    }
    _letterGrade = numToLetter(ans);
    isCalculated = true;
    notifyListeners();
  }

  void changeGrade(int index, String? value) {
    _quarterValues[index] = value;
    isCalculated = false;
    // CalculateGrade();
    notifyListeners();
  }
}
