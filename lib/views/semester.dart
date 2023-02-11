// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../constants/const.dart';

class SemesterCalculator extends StatefulWidget {
  const SemesterCalculator({super.key});

  @override
  State<SemesterCalculator> createState() => _SemesterCalculatorState();
}

class _SemesterCalculatorState extends State<SemesterCalculator> {
  List<String?> semesterValues = ["A", "A", "A"];
  String total = "";
  calSem() {
    int quater1 = letterToNum(semesterValues[0]!) * 2;
    int quater2 = letterToNum(semesterValues[1]!) * 2;
    int midterm = letterToNum(semesterValues[2]!) * 1;
    int preCalc = quater1 + quater2 + midterm;
    double ans = preCalc / 5;
    setState(() {
      total = numToLetter(ans);
    });
  }

  @override
  Widget build(BuildContext context) {
    calSem();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Semester Courses"),
      ),
      drawer: sideDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Course grade is...",
              style: TextStyle(fontSize: 17),
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
                  value: semesterValues[0],
                  onChanged: (String? value) {
                    setState(() {
                      semesterValues[0] = value;
                    });
                  },
                )
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
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
                  value: semesterValues[1],
                  onChanged: (String? value) {
                    setState(() {
                      semesterValues[1] = value;
                    });
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
                  value: semesterValues[2],
                  onChanged: (String? value) {
                    setState(() {
                      semesterValues[2] = value;
                    });
                  },
                )
              ],
            ),
            // SizedBox(
            //   width: 100,
            //   height: 50,
            //   child: TextButton(
            //     onPressed: (() {}),
            //     child: const Text("Calculate"),
            //   ),
            // ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text("* All grades calculated using HCPSS Policy 8020.")
          ],
        ),
      ),
    );
  }
}
