import 'package:flutter/material.dart';
import 'package:hcgradeapp/views/highschool/explain_view/explain_semester.dart';
import 'package:hcgradeapp/views/highschool/widgets/calculate_and_reset.dart';
import 'package:hcgradeapp/views/highschool/widgets/grade_info_bar.dart';
import 'package:hcgradeapp/views/highschool/widgets/grade_tile.dart';
import 'package:provider/provider.dart';
import '../../constants/const.dart';
import '../../providers/highschool/semester_course_calculator_provider.dart';

class SemesterCalculator extends StatelessWidget {
  const SemesterCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    SemesterCourseProvider provider = context.watch<SemesterCourseProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Semester Courses",
          style: TextStyle(color: Colors.white),
        ),
        leading: drawerIcon(),
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: () async {
                if (provider.isCalculated) {
                  Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        const ExplainHowSemesterView(),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: const Icon(Icons.question_mark_rounded))
        ],
      ),
      drawer: sideDrawer(context),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Column(
        children: <Widget>[
          GradeInfoBar(
            gradeValue: context.watch<SemesterCourseProvider>().letterGrade,
            isCalculated: provider.isCalculated,
          ),
          greyLineBreak(),
          ListView.builder(
            shrinkWrap: true,
            itemCount:
                context.watch<SemesterCourseProvider>().semesterValues.length,
            itemBuilder: (context, index) {
              return GradeTile(
                title: indexToSemesterName(index),
                grade: provider.semesterValues[index],
                onChanged: (String? value) {
                  context
                      .read<SemesterCourseProvider>()
                      .changeGrade(index, value);
                },
              );
            },
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          CalculateAndReset(resetOnPressed: () {
            context.read<SemesterCourseProvider>().resetGrade();
          }, calculateOnPressed: () {
            context.read<SemesterCourseProvider>().calculateGrade();
          }),
        ],
      ),
    );
  }
}
