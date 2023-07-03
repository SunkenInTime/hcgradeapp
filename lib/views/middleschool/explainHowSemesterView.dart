import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../constants/const.dart';
import '../../providers/middleschool/semester_course_calculator_provider.dart';
import '../../themes/theme_const.dart';

class MiddleSchoolExplainHowSemesterView extends StatelessWidget {
  const MiddleSchoolExplainHowSemesterView({super.key});

  @override
  Widget build(BuildContext context) {
    MiddleSchoolSemesterCourseProvider provider =
        context.watch<MiddleSchoolSemesterCourseProvider>();
    List<String?> semesterValues = provider.semesterValues;
    int quarter1 = letterToNum(semesterValues[0]!);
    int quarter2 = letterToNum(semesterValues[1]!);

    int addedGrades = quarter1 + quarter2;
    double dividedGrades = addedGrades / 2;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quarter 1 = ${provider.semesterValues[0]} = $quarter1 \n'
              'Quarter 2 = ${provider.semesterValues[1]} = $quarter2 \n',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
              child: Text(
                '$quarter1 + $quarter2 = $addedGrades / 2 = $dividedGrades\n'
                '$dividedGrades = ${provider.letterGrade}\n',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            const Text(
              '*Having two consecutive E\'s will \nresult in an overall grade of an E.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
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
                child: const Text(
                  "HCPSS Policy 8020",
                  style: TextStyle(color: secondaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
