import 'package:flutter/material.dart';

final listGradeOptions = ["A", "B", "C", "D", "E"];
final courseLevelOptions = ["Regular", "Honors", "AP and G/T"];
DropdownMenuItem<String> buildMenuItem(String theme) => DropdownMenuItem(
      value: theme,
      child: Text(
        theme,
        style: const TextStyle(),
      ),
    );

int letterToNum(String let) {
  if (let == "A") return 4;
  if (let == "B") return 3;
  if (let == "C") return 2;
  if (let == "D") return 1;
  if (let == "E") return 0;
  return 0;
}

double letterToNumWeighted(String let, String level) {
  if (level == "AP and G/T") {
    if (let == "A") return 5;
    if (let == "B") return 4;
    if (let == "C") return 3;
    if (let == "D") return 1;
    if (let == "E") return 0;
  } else if (level == "Honors") {
    if (let == "A") return 4.5;
    if (let == "B") return 3.5;
    if (let == "C") return 2.5;
    if (let == "D") return 1.0;
    if (let == "E") return 0;
  } else {
    if (let == "A") return 4;
    if (let == "B") return 3;
    if (let == "C") return 2;
    if (let == "D") return 1;
    if (let == "E") return 0;
  }
  return 0;
}

String numToLetter(double calc) {
  if (calc >= 3.5) {
    return "A";
  } else if (calc >= 2.5) {
    return "B";
  } else if (calc >= 1.5) {
    return "C";
  } else if (calc >= 0.75) {
    return "D";
  } else {
    return "E";
  }
}
