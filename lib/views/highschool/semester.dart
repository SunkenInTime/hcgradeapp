// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hcgradeapp/views/highschool/explainHowSemesterView.dart';
import 'package:hcgradeapp/views/highschool/widgets/calculate_and_reset.dart';
import 'package:hcgradeapp/views/highschool/widgets/grade_info_bar.dart';
import 'package:provider/provider.dart';

import '../../constants/const.dart';
import '../../constants/icons.dart';
import '../../providers/highschool/semester_course_calculator_provider.dart';
import '../../themes/theme_const.dart';

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
        // mainAxisAlignment: MainAxisAlignment.center,
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 14, right: 14, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          indexToSemesterName(index),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
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
                                    .watch<SemesterCourseProvider>()
                                    .semesterValues[index],
                                onChanged: (String? value) {
                                  return context
                                      .read<SemesterCourseProvider>()
                                      .changeGrade(index, value);
                                },
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ), // Set the font size and color here
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
