import 'package:flutter/material.dart';
import 'package:hcgradeapp/providers/school_level_provider.dart';
import 'package:hcgradeapp/themes/theme_const.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'icons.dart';

final listGradeOptions = ["A", "B", "C", "D", "E"];
final courseLevelOptions = ["Regular", "Honors", "AP and G/T"];
final List<Course> defaultCourseListValues = [
  Course(letterGrade: "A", level: "Regular"),
  Course(letterGrade: "A", level: "Regular"),
  Course(letterGrade: "A", level: "Regular"),
  Course(letterGrade: "A", level: "Regular"),
  Course(letterGrade: "A", level: "Regular"),
  Course(letterGrade: "A", level: "Regular"),
  Course(letterGrade: "A", level: "Regular"),
];
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

Widget sideDrawer(BuildContext context) {
  return Drawer(
    backgroundColor:
        context.watch<SchoolLevelProvider>().schoolLevel == "middle"
            ? secondaryColor
            : mainColor,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 120,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Icon(
                  CustomIcons.menusquare,
                  color: Colors.white,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: "SF Pro Text",
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        ListTile(
          title: const Text(
            "Highschool",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () {
            context.read<SchoolLevelProvider>().ChangeLevel("highschool");
          },
        ),
        ListTile(
          title: const Text(
            "Middle School",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () {
            context.read<SchoolLevelProvider>().ChangeLevel("middle");
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
              width: 20,
              height: 42,
              child: ElevatedButton(
                  onPressed: () {
                    launchUrlString(
                        "https://me.daracloud.uk/privacy-policies/grade-aid-privacy-policy/",
                        mode: LaunchMode.externalApplication);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text("Privacy Policy"))),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: BuyMeACoffeeButton(
            buyMeACoffeeName: "sunkenintime",
            color: BuyMeACoffeeColor.Violet,
          ),
        ),
        const Text(
          "Support me :)",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
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

String indexToSemesterName(int value) {
  if (value <= 1) {
    return "Quarter ${value + 1}";
  }
  return "Final";
}

Widget greyLineBreak() {
  return const Divider(
    height: 1,
    color: Color.fromRGBO(0, 0, 0, 0.116),
    thickness: 1,
    indent: 20,
    endIndent: 20,
  );
}

Widget fullgreyLineBreak() {
  return const Divider(
    height: 1,
    color: Color.fromRGBO(0, 0, 0, 0.116),
    thickness: 1,
    // indent: 20,
    // endIndent: 20,
  );
}

Widget blackLineBreak() {
  return const Divider(
    height: 1,
    color: Colors.black,
    thickness: 1,
    indent: 20,
    endIndent: 20,
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

const snackBar = SnackBar(content: Text("Please calculate your changes."));
