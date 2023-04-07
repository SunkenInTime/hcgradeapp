import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/routes.dart';

import 'icons.dart';

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

Widget sideDrawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 120,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text(
            "Full Year Course",
            style: TextStyle(fontSize: 15),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(courseCalculatorRoute);
          },
          leading: const Icon(Icons.menu_book_rounded),
        ),
        ListTile(
          title: const Text(
            "Semester Courses",
            style: TextStyle(fontSize: 15),
          ),
          leading: const Icon(Icons.book),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                semesterCalculatorRoute, (route) => false);
          },
        ),
        ListTile(
            title: const Text(
              "GPA Calculator",
              style: TextStyle(fontSize: 15),
            ),
            leading: const Icon(Icons.calculate_outlined),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  gpaCalculatorRoute, (route) => false);
            }),
        ListTile(
            title: const Text(
              "Percentage Calculator",
              style: TextStyle(fontSize: 15),
            ),
            leading: const Icon(Icons.percent_rounded),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  percentageCalculatorRoute, (route) => false);
            }),
      ],
    ),
  );
}

List<String> calculatePercentage(double givenScore, double maxScore) {
  double percentage = givenScore / maxScore;
  percentage *= 100;
  List<String> percentAndLetter = ["", ""];
  percentage = double.parse(percentage.toStringAsFixed(2));
  percentAndLetter[0] = "$percentage%";
  percentAndLetter[1] = calculateLetterWithPercent(percentage);
  return percentAndLetter;
}

String calculateLetterWithPercent(double percent) {
  if (percent >= 89.5) {
    return "A";
  } else if (percent >= 79.5) {
    return "B";
  } else if (percent >= 69.5) {
    return "C";
  } else if (percent >= 59.5) {
    return "D";
  } else {
    return "E";
  }
}

bool isNumber(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

class Course {
  String? letterGrade;
  String? level;
  Course({required this.letterGrade, required this.level});
}

String indexToCourseName(int value) {
  if (value <= 3) {
    return "Quarter ${value + 1}";
  } else if (value == 4) {
    return "Midterm";
  }
  return "Final";
}

Widget greyLineBreak() {
  return const Divider(
    height: 1,
    color: Color.fromRGBO(0, 0, 0, 0.116),
    thickness: 1,
    indent: 10,
    endIndent: 10,
  );
}

Widget drawerIcon() {
  return Builder(
    builder: (context) => IconButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      icon: const Icon(CustomIcons.menusquare),
    ),
  );
}
