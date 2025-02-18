import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/icons.dart';
import 'package:hcgradeapp/themes/theme_const.dart';
import 'package:hcgradeapp/views/highschool/explainHowFullYearView.dart';
import 'package:hcgradeapp/views/highschool/widgets/calculate_and_reset.dart';
import 'package:hcgradeapp/views/highschool/widgets/grade_info_bar.dart';
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
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GradeInfoBar(
                gradeValue: provider.letterGrade,
                isCalculated: provider.isCalculated,
              ),
              greyLineBreak(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: provider.quarterValues.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 14,
                          right: 14,
                          bottom: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              indexToCourseName(index),
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 42,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: const Icon(
                                      CustomIcons.caretdownicon,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    items: listGradeOptions.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    value: context
                                        .watch<CourseCalculatorProvider>()
                                        .quarterValues[index],
                                    onChanged: (String? value) {
                                      return context
                                          .read<CourseCalculatorProvider>()
                                          .changeGrade(index, value);
                                    },
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      greyLineBreak(),
                    ],
                  );
                },
              ),
            ],
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
