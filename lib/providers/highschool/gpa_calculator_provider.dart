import 'package:flutter/material.dart';

import '../../constants/const.dart';

class GpaProvider with ChangeNotifier {
  bool editMode = false;
  bool isCalculated = true;
  List<Course> _courseValues = [
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
  void removeCourse(int index) {
    if (courseValues.length <= 1) return;
    _courseValues.removeAt(index);
    calculateGPA();
    isCalculated = true;
    notifyListeners();
  }

  void resetGPA() {
    _courseValues = [
      Course(letterGrade: "A", level: "Regular"),
      Course(letterGrade: "A", level: "Regular"),
      Course(letterGrade: "A", level: "Regular"),
      Course(letterGrade: "A", level: "Regular"),
      Course(letterGrade: "A", level: "Regular"),
      Course(letterGrade: "A", level: "Regular"),
      Course(letterGrade: "A", level: "Regular"),
    ];

    calculateGPA();

    notifyListeners();
  }

  void addCourse() {
    _courseValues.add(Course(letterGrade: "A", level: "Regular"));
    isCalculated = false;
    notifyListeners();
  }

  void updateCourse(int index, Course newCourse) {
    _courseValues[index] = newCourse;
    isCalculated = false;
    notifyListeners();
  }

  void calculateGPA() {
    double ans = 0;
    for (Course course in _courseValues) {
      ans += letterToNumWeighted(course.letterGrade!, course.level!);
    }
    double length = _courseValues.length.toDouble();

    ans = ans / length;

    _gpaValue = ans.toStringAsFixed(2);
    isCalculated = true;
    notifyListeners();
  }

  void toggleMode() {
    if (editMode) {
      editMode = false;
    } else {
      editMode = true;
    }
    // log(editMode.toString());

    notifyListeners();
  }
}
