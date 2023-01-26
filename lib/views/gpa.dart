import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../constants/routes.dart';

class GPACalculator extends StatefulWidget {
  const GPACalculator({super.key});

  @override
  State<GPACalculator> createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  List<String?> courseValues = ["A", "A", "A", "A", "A", "A", "A"];
  List<String?> courseLevel = [
    "Regular",
    "Regular",
    "Regular",
    "Regular",
    "Regular",
    "Regular",
    "Regular",
  ];
  String total = "";
  List<bool> semesterCheck = [false, false];

  void calcGPA() {
    double ans = 0;
    double firstSem = 1;
    double secSem = 1;
    for (int i = 0; i < courseValues.length; i++) {
      ans += letterToNumWeighted(courseValues[i]!, courseLevel[i]!);
    }
    // if (semesterCheck[0] == true) {
    //   firstSem = 0.5;
    // }
    // if (semesterCheck[1] == true) {
    //   secSem = 0.5;
    // }
    double length = courseValues.length - 2;
    length += firstSem;
    length += secSem;
    log(length.toString());
    ans = ans / length;
    setState(() {
      total = ans.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    calcGPA();
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Calculator"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 80,
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
                Navigator.of(context)
                    .pushReplacementNamed(courseCalculatorRoute);
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
                })
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your GPA is...",
              style: TextStyle(fontSize: 17),
            ),
            Text(
              total.toString(),
              style: const TextStyle(fontSize: 70),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Course 1",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: courseValues[0],
                  onChanged: (String? value) {
                    setState(() {
                      courseValues[0] = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: courseLevelOptions.map(buildMenuItem).toList(),
                  value: courseLevel[0],
                  onChanged: (String? value) {
                    setState(() {
                      courseLevel[0] = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Course 2",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: courseValues[1],
                  onChanged: (String? value) {
                    setState(() {
                      courseValues[1] = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: courseLevelOptions.map(buildMenuItem).toList(),
                  value: courseLevel[1],
                  onChanged: (String? value) {
                    setState(() {
                      courseLevel[1] = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Course 3",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: courseValues[2],
                  onChanged: (String? value) {
                    setState(() {
                      courseValues[2] = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: courseLevelOptions.map(buildMenuItem).toList(),
                  value: courseLevel[2],
                  onChanged: (String? value) {
                    setState(() {
                      courseLevel[2] = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Course 4",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: courseValues[3],
                  onChanged: (String? value) {
                    setState(() {
                      courseValues[3] = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: courseLevelOptions.map(buildMenuItem).toList(),
                  value: courseLevel[3],
                  onChanged: (String? value) {
                    setState(() {
                      courseLevel[3] = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Course 5",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: courseValues[4],
                  onChanged: (String? value) {
                    setState(() {
                      courseValues[4] = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: courseLevelOptions.map(buildMenuItem).toList(),
                  value: courseLevel[4],
                  onChanged: (String? value) {
                    setState(() {
                      courseLevel[4] = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Course 6",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: courseValues[5],
                  onChanged: (String? value) {
                    setState(() {
                      courseValues[5] = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: courseLevelOptions.map(buildMenuItem).toList(),
                  value: courseLevel[5],
                  onChanged: (String? value) {
                    setState(() {
                      courseLevel[5] = value;
                    });
                  },
                ),
                // Checkbox(
                //     value: semesterCheck[0],
                //     onChanged: (e) {
                //       setState(() {
                //         semesterCheck[0] = e!;
                //       });
                //     })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Course 7",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                DropdownButton<String>(
                  items: listGradeOptions.map(buildMenuItem).toList(),
                  value: courseValues[6],
                  onChanged: (String? value) {
                    setState(() {
                      courseValues[6] = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  items: courseLevelOptions.map(buildMenuItem).toList(),
                  value: courseLevel[6],
                  onChanged: (String? value) {
                    setState(() {
                      courseLevel[6] = value;
                    });
                  },
                ),
                // Checkbox(
                //     value: semesterCheck[1],
                //     onChanged: (e) {
                //       setState(() {
                //         semesterCheck[1] = e!;
                //       });
                //     })
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
