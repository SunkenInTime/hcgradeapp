import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants/const.dart';

class GpaProvider with ChangeNotifier {
  final List<Course> _courseValues = [
    Course(letterGrade: "A", level: "Regular"),
    Course(letterGrade: "A", level: "Regular"),
    Course(letterGrade: "A", level: "Regular"),
    Course(letterGrade: "A", level: "Regular"),
    Course(letterGrade: "A", level: "Regular"),
    Course(letterGrade: "A", level: "Regular"),
    Course(letterGrade: "A", level: "Regular"),
  ];
  String _gpaValue = "4.00";
  List<Course> get courseValues => _courseValues;
  String get gpaValue => _gpaValue;
  void removeCourse() {
    if (courseValues.length <= 1) return;
    _courseValues.removeLast();
    calculateGPA();
    notifyListeners();
  }

  void addCourse() {
    _courseValues.add(Course(letterGrade: "A", level: "Regular"));
    calculateGPA();
    notifyListeners();
  }

  void updateCourse(int index, Course newCourse) {
    _courseValues[index] = newCourse;
    calculateGPA();
    notifyListeners();
  }

  void calculateGPA() {
    double ans = 0;
    for (Course course in _courseValues) {
      ans += letterToNumWeighted(course.letterGrade!, course.level!);
    }
    double length = _courseValues.length.toDouble();
    log(length.toString());
    ans = ans / length;

    _gpaValue = ans.toStringAsFixed(2);
    notifyListeners();
  }
}
