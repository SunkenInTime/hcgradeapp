import 'package:flutter/material.dart';
import 'package:hcgradeapp/views/highschool/explain_view/explain_full_year.dart';
import 'package:hcgradeapp/views/highschool/widgets/calculate_and_reset.dart';
import 'package:hcgradeapp/views/highschool/widgets/grade_info_bar.dart';
import 'package:hcgradeapp/views/highschool/widgets/grade_tile.dart';
import 'package:provider/provider.dart';
import '../../constants/const.dart';
import '../../providers/highschool/full_course_calculator_provider.dart';

class FullYearCourseCalculator extends StatelessWidget {
  const FullYearCourseCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    CourseCalculatorProvider provider =
        context.watch<CourseCalculatorProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Full Year Course",
          style: TextStyle(color: Colors.white),
        ),
        leading: drawerIcon(),
        actions: [
          IconButton(
              onPressed: () async {
                if (provider.isCalculated) {
                  Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        const ExplainHowFullYearView(),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: const Icon(Icons.question_mark_rounded))
        ],
        centerTitle: true,
        toolbarHeight: 70,
      ),
      drawer: sideDrawer(context),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Column(
        children: [
          GradeInfoBar(
            gradeValue: provider.letterGrade,
            isCalculated: provider.isCalculated,
          ),
          greyLineBreak(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: provider.quarterValues.length,
            itemBuilder: (context, index) {
              return GradeTile(
                title: indexToCourseName(index),
                grade: context
                    .watch<CourseCalculatorProvider>()
                    .quarterValues[index],
                onChanged: (String? value) {
                  context
                      .read<CourseCalculatorProvider>()
                      .changeGrade(index, value);
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CalculateAndReset(
              resetOnPressed: () {
                context.read<CourseCalculatorProvider>().resetGrade();
              },
              calculateOnPressed: () {
                context.read<CourseCalculatorProvider>().calculateGrade();
              },
            ),
          ),
        ],
      ),
    );
  }
}
