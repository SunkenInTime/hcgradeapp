import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/routes.dart';
import 'package:hcgradeapp/providers/full_course_calculator_provider.dart';
import 'package:hcgradeapp/providers/semester_course_calculator_provider.dart';
import 'package:hcgradeapp/views/gpa.dart';
import 'package:hcgradeapp/views/percentage.dart';
import 'package:hcgradeapp/views/semester.dart';
import 'package:provider/provider.dart';
import 'constants/const.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CourseCalculatorProvider()),
      ChangeNotifierProvider(create: (_) => SemesterCourseProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const CourseCalculator(title: 'Full Year Course'),
      routes: {
        courseCalculatorRoute: (context) => const CourseCalculator(
              title: "Course Final Grade Calculator",
            ),
        semesterCalculatorRoute: (context) => const SemesterCalculator(),
        gpaCalculatorRoute: (context) => const GPACalculator(),
        percentageCalculatorRoute: (context) =>
            const PercentageCalculatorView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class CourseCalculator extends StatelessWidget {
  const CourseCalculator({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: sideDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Course grade is...",
              style: TextStyle(fontSize: 17),
            ),
            Text(
              //Fetches the calculated letter grade
              context.watch<CourseCalculatorProvider>().letterGrade,
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
                  value: context
                      .watch<CourseCalculatorProvider>()
                      .quarterValues[0],
                  onChanged: (String? value) {
                    return context
                        .read<CourseCalculatorProvider>()
                        .ChangeGrade(0, value);
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
                  value: context
                      .watch<CourseCalculatorProvider>()
                      .quarterValues[1],
                  onChanged: (String? value) {
                    return context
                        .read<CourseCalculatorProvider>()
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
                  value: context
                      .watch<CourseCalculatorProvider>()
                      .quarterValues[4],
                  onChanged: (String? value) {
                    return context
                        .read<CourseCalculatorProvider>()
                        .ChangeGrade(4, value);
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
                  value: context
                      .watch<CourseCalculatorProvider>()
                      .quarterValues[2],
                  onChanged: (String? value) {
                    return context
                        .read<CourseCalculatorProvider>()
                        .ChangeGrade(2, value);
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
                  value: context
                      .watch<CourseCalculatorProvider>()
                      .quarterValues[3],
                  onChanged: (String? value) {
                    return context
                        .read<CourseCalculatorProvider>()
                        .ChangeGrade(3, value);
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
                  value: context
                      .watch<CourseCalculatorProvider>()
                      .quarterValues[5],
                  onChanged: (String? value) {
                    return context
                        .read<CourseCalculatorProvider>()
                        .ChangeGrade(5, value);
                  },
                )
              ],
            ),
            // SizedBox(
            //   width: 100,
            //   height: 50,
            //   child: TextButton(
            //     onPressed: (() {
            //       calCourse();
            //     }),
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
