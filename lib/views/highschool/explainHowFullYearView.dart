import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../constants/const.dart';
import '../../providers/highschool/full_course_calculator_provider.dart';
import '../../themes/theme_const.dart';

class ExplainHowFullYearView extends StatefulWidget {
  const ExplainHowFullYearView({super.key});

  @override
  State<ExplainHowFullYearView> createState() => _ExplainHowFullYearViewState();
}

class _ExplainHowFullYearViewState extends State<ExplainHowFullYearView> {
  @override
  Widget build(BuildContext context) {
    CourseCalculatorProvider provider =
        context.watch<CourseCalculatorProvider>();
    List<String?> quarterValues = provider.quarterValues;
    int quarter1 = letterToNum(quarterValues[0]!);
    int quarter2 = letterToNum(quarterValues[1]!);
    int quarter3 = letterToNum(quarterValues[2]!);
    int quarter4 = letterToNum(quarterValues[3]!);
    int midterm = letterToNum(quarterValues[4]!);
    int finals = letterToNum(quarterValues[5]!);
    int multipliedQuarter1 = letterToNum(quarterValues[0]!) * 2;
    int multipliedQuarter2 = letterToNum(quarterValues[1]!) * 2;
    int multipliedQuarter3 = letterToNum(quarterValues[2]!) * 2;
    int multipliedQuarter4 = letterToNum(quarterValues[3]!) * 2;
    int multipliedMidterm = letterToNum(quarterValues[4]!) * 1;
    int multipledFinals = letterToNum(quarterValues[5]!) * 1;
    int addedGrades = multipliedQuarter1 +
        multipliedQuarter2 +
        multipliedQuarter3 +
        multipliedQuarter4 +
        multipliedMidterm +
        multipledFinals;
    double dividedGrades = addedGrades / 10;
    Colors.white;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(216),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quarter 1 = ${provider.quarterValues[0]} = $quarter1 * 2 = ${quarter1 * 2}\n'
              'Quarter 2 = ${provider.quarterValues[1]} = $quarter2 * 2 = ${quarter2 * 2}\n'
              'Quarter 3 = ${provider.quarterValues[2]} = $quarter3 * 2 = ${quarter3 * 2}\n'
              'Quarter 4 = ${provider.quarterValues[3]} = $quarter4 * 2 = ${quarter4 * 2}\n'
              'Midterm = ${provider.quarterValues[4]} = $midterm * 1 = ${midterm * 1}\n'
              'Final = ${provider.quarterValues[5]} = $finals * 1 = ${finals * 1}\n',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
              child: Text(
                '$multipliedQuarter1 + $multipliedQuarter2 + $multipliedQuarter3 + $multipliedQuarter4 + $midterm + $finals = $addedGrades / 10 = $dividedGrades\n'
                '$dividedGrades = ${provider.letterGrade}\n',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            const Text(
              '*Having two consecutive E\'s will \nresult in an overall grade of an E',
              textAlign: TextAlign.center,
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
                child: const Text(
                  "HCPSS Policy 8020",
                ))
          ],
        ),
      ),
    );
  }
}
