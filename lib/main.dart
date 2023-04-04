import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/routes.dart';
import 'package:hcgradeapp/providers/full_course_calculator_provider.dart';
import 'package:hcgradeapp/providers/gpa_calculator_provider.dart';
import 'package:hcgradeapp/providers/semester_course_calculator_provider.dart';
import 'package:hcgradeapp/views/fullyear.dart';
import 'package:hcgradeapp/views/gpa.dart';
import 'package:hcgradeapp/views/percentage.dart';
import 'package:hcgradeapp/views/semester.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CourseCalculatorProvider()),
      ChangeNotifierProvider(create: (_) => SemesterCourseProvider()),
      ChangeNotifierProvider(create: (_) => GpaProvider()),
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
      home: const FullYearCourseCalculator(),
      routes: {
        courseCalculatorRoute: (context) => const FullYearCourseCalculator(),
        semesterCalculatorRoute: (context) => const SemesterCalculator(),
        gpaCalculatorRoute: (context) => const GPACalculator(),
        percentageCalculatorRoute: (context) =>
            const PercentageCalculatorView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
