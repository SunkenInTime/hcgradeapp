import 'package:flutter/material.dart';

import '../constants/const.dart';

class GpaProvider with ChangeNotifier {
  final List<Course> _courseValues = [];
  List<Course> get courseValues => _courseValues;

  void RemoveCourse() {
    _courseValues.removeLast();
    notifyListeners();
  }

  void AddCourse() {
    _courseValues.add(Course(letterGrade: "A", level: "Regular"));
    notifyListeners();
  }

  void UpdateCourse(int index, Course newCourse) {
    _courseValues[index] = newCourse;
    notifyListeners();
  }
}
