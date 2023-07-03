import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../constants/const.dart';
import '../../providers/middleschool/full_course_calculator_provider.dart';
import '../../themes/theme_const.dart';

class MiddleSchoolExplainHowFullYearView extends StatefulWidget {
  const MiddleSchoolExplainHowFullYearView({super.key});

  @override
  State<MiddleSchoolExplainHowFullYearView> createState() =>
      _MiddleSchoolExplainHowFullYearViewState();
}

class _MiddleSchoolExplainHowFullYearViewState
    extends State<MiddleSchoolExplainHowFullYearView> {
  @override
  Widget build(BuildContext context) {
    MiddleSchoolCourseCalculatorProvider provider =
        context.watch<MiddleSchoolCourseCalculatorProvider>();
    List<String?> quarterValues = provider.quarterValues;
    int quarter1 = letterToNum(quarterValues[0]!);
    int quarter2 = letterToNum(quarterValues[1]!);
    int quarter3 = letterToNum(quarterValues[2]!);
    int quarter4 = letterToNum(quarterValues[3]!);

    int addedGrades = quarter1 + quarter2 + quarter3 + quarter4;

    double dividedGrades = addedGrades / 4;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           Navigator.pop(context);
      //         },
      //         icon: const Icon(Icons.close))
      //   ],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quarter 1 = ${provider.quarterValues[0]} = $quarter1 \n'
              'Quarter 2 = ${provider.quarterValues[1]} = $quarter2 \n'
              'Quarter 3 = ${provider.quarterValues[2]} = $quarter3 \n'
              'Quarter 4 = ${provider.quarterValues[3]} = $quarter4 \n',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
              child: Text(
                '$quarter1 + $quarter2 + $quarter3 + $quarter4 = $addedGrades / 4 = $dividedGrades\n'
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
