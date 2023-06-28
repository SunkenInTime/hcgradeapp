import 'package:flutter/material.dart';

import '../constants/const.dart';

class PercentageProvider with ChangeNotifier {
  String _percentageValue = "100%";
  String _letterGrade = "A";
  String get letterGrade => _letterGrade;
  String get percentageValue => _percentageValue;

  void calculatePercent(double min, double max) {
    double percentage = min / max;
    percentage *= 100;
    List<String> percentAndLetter = ["", ""];
    percentage = double.parse(percentage.toStringAsFixed(2));
    percentAndLetter[0] = "$percentage%";
    percentAndLetter[1] = calculateLetterWithPercent(percentage);
    _letterGrade = percentAndLetter[1];
    _percentageValue = percentAndLetter[0];
    notifyListeners();
  }
}
