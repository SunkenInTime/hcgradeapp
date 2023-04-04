// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/const.dart';
import '../providers/semester_course_calculator_provider.dart';

class SemesterCalculator extends StatelessWidget {
  const SemesterCalculator({super.key});

  @override
  Widget build(BuildContext context) {
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
              context.watch<SemesterCourseProvider>().letterGrade,
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
                  value:
                      context.watch<SemesterCourseProvider>().semesterValues[0],
                  onChanged: (String? value) {
                    context
                        .read<SemesterCourseProvider>()
                        .ChangeGrade(0, value);
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
                  value:
                      context.watch<SemesterCourseProvider>().semesterValues[1],
                  onChanged: (String? value) {
                    context
                        .read<SemesterCourseProvider>()
                        .ChangeGrade(1, value);
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
                  value:
                      context.watch<SemesterCourseProvider>().semesterValues[2],
                  onChanged: (String? value) {
                    context
                        .read<SemesterCourseProvider>()
                        .ChangeGrade(2, value);
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
