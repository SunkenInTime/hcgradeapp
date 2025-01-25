import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/const.dart';
import 'package:hcgradeapp/providers/highschool/gpa_calculator_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../themes/theme_const.dart';

class ExplainHowGPAView extends StatefulWidget {
  const ExplainHowGPAView({super.key});

  @override
  State<ExplainHowGPAView> createState() => _ExplainHowGPAViewState();
}

class _ExplainHowGPAViewState extends State<ExplainHowGPAView> {
  @override
  Widget build(BuildContext context) {
    GpaProvider provider = context.watch<GpaProvider>();
    List<Course> courseValues = provider.courseValues;
    String textBuilder() {
      String text = "";
      double addedNumbers = 0;
      for (int i = 0; i < courseValues.length; i++) {
        Course course = courseValues[i];
        text +=
            'Course ${i + 1} = ${course.letterGrade}, ${course.level} = ${letterToNumWeighted(course.letterGrade!, course.level!)}\n';
      }
      text += "\n";

      for (int i = 0; i < courseValues.length; i++) {
        Course course = courseValues[i];
        if (i != courseValues.length - 1) {
          text +=
              "${letterToNumWeighted(course.letterGrade!, course.level!)} + ";
          addedNumbers +=
              letterToNumWeighted(course.letterGrade!, course.level!);
        } else {
          text += "${letterToNumWeighted(course.letterGrade!, course.level!)}";
          addedNumbers +=
              letterToNumWeighted(course.letterGrade!, course.level!);
        }
      }
      text += " = $addedNumbers\n";
      text +=
          "$addedNumbers  / ${courseValues.length} = ${(addedNumbers / courseValues.length.toDouble()).toStringAsFixed(2)}";

      return text;
    }

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.90),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textBuilder(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            const SizedBox(height: 15),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: mainColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  launchUrlString(
                    "https://policy.hcpss.org/8000/8020/",
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: Text(
                  "HCPSS Policy 8020",
                  style: TextStyle(
                    color: mainColor,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
