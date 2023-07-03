import 'package:flutter/material.dart';

import '../../constants/const.dart';

class MiddleSchoolCourseCalculatorProvider with ChangeNotifier {
  List<String?> _quarterValues = ["A", "A", "A", "A"];
  String _letterGrade = "A";
  bool isCalculated = true;

  String get letterGrade => _letterGrade;
  List<String?> get quarterValues => _quarterValues;

  void resetGrade() {
    _quarterValues = ["A", "A", "A", "A"];
    CalculateGrade();
    notifyListeners();
  }

  void CalculateGrade() {
    int quarter1 = letterToNum(_quarterValues[0]!);
    int quarter2 = letterToNum(_quarterValues[1]!);
    int quarter3 = letterToNum(_quarterValues[2]!);
    int quarter4 = letterToNum(_quarterValues[3]!);

    int calc = quarter1 + quarter2 + quarter3 + quarter4;
    double ans = calc / 4;
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

  void ChangeGrade(int index, String? value) {
    _quarterValues[index] = value;
    isCalculated = false;
    // CalculateGrade();
    notifyListeners();
  }
}
