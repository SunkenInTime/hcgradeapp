// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hcgradeapp/views/highschool/explainHowSemesterView.dart';
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
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Your grade",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                    Text(
                      //Fetches the calculated letter grade
                      context.watch<SemesterCourseProvider>().letterGrade,
                      style: const TextStyle(
                          fontSize: 60,
                          fontFamily: "SF Pro Text",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "*All grades are calculated\n using HCPSS Policy 8020.",
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 3)),
                    provider.isCalculated
                        ? const SizedBox(
                            width: 0,
                            height: 0,
                          )
                        : const Text(
                            "Changes have not \n been calculated.",
                            style: TextStyle(color: Colors.red),
                          ),
                  ],
                ),
              ],
            ),
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
                                      .ChangeGrade(index, value);
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 49,
              width: MediaQuery.of(context).size.width * 0.42,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFADADAD),
                ),
                onPressed: () {
                  context.read<SemesterCourseProvider>().resetGrade();
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            SizedBox(
              height: 49,
              width: MediaQuery.of(context).size.width * 0.42,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                ),
                onPressed: () {
                  context.read<SemesterCourseProvider>().CalculateGrade();
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ]),
          // provider.isCalculated
          //     ? const SizedBox(
          //         width: 0,
          //         height: 0,
          //       )
          //     : const Text(
          //         "Changes have not been calculated.",
          //         style: TextStyle(color: Colors.red),
          //       ),
        ],
      ),
    );
  }
}
