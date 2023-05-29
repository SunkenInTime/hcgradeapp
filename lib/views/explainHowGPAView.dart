import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExplainHowGPAView extends StatefulWidget {
  const ExplainHowGPAView({super.key});

  @override
  State<ExplainHowGPAView> createState() => _ExplainHowGPAViewState();
}

class _ExplainHowGPAViewState extends State<ExplainHowGPAView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quarter 1 = ${provider.semesterValues[0]} = $quarter1 * 2 = ${quarter1 * 2}\n'
              'Quarter 2 = ${provider.semesterValues[1]} = $quarter2 * 2 = ${quarter2 * 2}\n'
              'Midterm = ${provider.semesterValues[2]} = $midterm * 1 = ${midterm * 1}\n',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$multipliedQuarter1 + $multipliedQuarter2 + $midterm = $addedGrades / 5 = $dividedGrades\n'
                '$dividedGrades = ${provider.letterGrade}\n'
                '*Having two consecutive E\'s will result in an overall grade of an E',
                textAlign: TextAlign.center,
              ),
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
