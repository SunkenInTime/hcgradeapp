import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants/const.dart';

class FullYearCourseCalculator extends StatefulWidget {
  const FullYearCourseCalculator({super.key, required this.title});

  final String title;

  @override
  State<FullYearCourseCalculator> createState() =>
      _FullYearCourseCalculatorState();
}

class _FullYearCourseCalculatorState extends State<FullYearCourseCalculator> {
  List<String?> quarterValues = ["A", "A", "A", "A", "A", "A"];
  String total = "";
  calCourse() {
    int quater1 = letterToNum(quarterValues[0]!) * 2;
    int quater2 = letterToNum(quarterValues[1]!) * 2;
    int quater3 = letterToNum(quarterValues[2]!) * 2;
    int quater4 = letterToNum(quarterValues[3]!) * 2;
    int midterm = letterToNum(quarterValues[4]!) * 1;
    int finals = letterToNum(quarterValues[5]!) * 1;
    int preCalc = quater1 + quater2 + quater3 + quater4 + midterm + finals;
    double ans = preCalc / 10;
    setState(() {
      total = numToLetter(ans);
    });
  }

  @override
  Widget build(BuildContext context) {
    calCourse();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: sideDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Course grade is...",
              style: TextStyle(fontSize: 17, fontFamily: "Uniform"),
            ),
            Text(
              total,
              style: const TextStyle(fontSize: 70),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Quarter 1",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: quarterValues[0],
                  onChanged: (String? value) {
                    setState(() {
                      quarterValues[0] = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Quarter 2",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: quarterValues[1],
                  onChanged: (String? value) {
                    setState(() {
                      quarterValues[1] = value;
                    });
                    log(quarterValues.toString());
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Midterm",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: quarterValues[4],
                  onChanged: (String? value) {
                    setState(() {
                      quarterValues[4] = value;
                    });
                    log(quarterValues.toString());
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Quarter 3",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: quarterValues[2],
                  onChanged: (String? value) {
                    setState(() {
                      quarterValues[2] = value;
                    });
                    log(quarterValues.toString());
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Quarter 4",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: quarterValues[3],
                  onChanged: (String? value) {
                    setState(() {
                      quarterValues[3] = value;
                    });
                    log(quarterValues.toString());
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Final",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: quarterValues[5],
                  onChanged: (String? value) {
                    setState(() {
                      quarterValues[5] = value;
                    });
                    log(quarterValues.toString());
                  },
                )
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text("* All grades calculated using HCPSS Policy 8020.")
          ],
        ),
      ),
    );
  }
}
