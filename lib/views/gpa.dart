import 'package:flutter/material.dart';
import 'package:hcgradeapp/providers/gpa_calculator_provider.dart';
import 'package:provider/provider.dart';

import '../constants/const.dart';

class GPACalculator extends StatefulWidget {
  const GPACalculator({super.key});

  @override
  State<GPACalculator> createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Calculator"),
      ),
      drawer: sideDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your GPA is...",
              style: TextStyle(fontSize: 17),
            ),
            Text(
              context.watch<GpaProvider>().gpaValue,
              style: const TextStyle(fontSize: 70),
            ),
            SizedBox(
              height: 473.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              context.watch<GpaProvider>().courseValues.length,
                          itemBuilder: (context, index) {
                            final course = context
                                .watch<GpaProvider>()
                                .courseValues[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Course ${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10)),
                                //Letter grade
                                DropdownButton<String>(
                                  items: listGradeOptions
                                      .map(buildMenuItem)
                                      .toList(),
                                  value: course.letterGrade,
                                  onChanged: (String? value) {
                                    context.read<GpaProvider>().updateCourse(
                                          index,
                                          Course(
                                            letterGrade: value,
                                            level: course.level,
                                          ),
                                        );
                                  },
                                ),
                                DropdownButton<String>(
                                  items: courseLevelOptions
                                      .map(buildMenuItem)
                                      .toList(),
                                  value: course.level,
                                  onChanged: (String? value) {
                                    context.read<GpaProvider>().updateCourse(
                                          index,
                                          Course(
                                            letterGrade: course.letterGrade,
                                            level: value,
                                          ),
                                        );
                                  },
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<GpaProvider>().addCourse();
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<GpaProvider>().removeCourse();
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  const Text("* All grades calculated using HCPSS Policy 8020.")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
