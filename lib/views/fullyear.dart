import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/icons.dart';
import 'package:hcgradeapp/themes/theme_const.dart';
import 'package:provider/provider.dart';

import '../constants/const.dart';
import '../providers/full_course_calculator_provider.dart';

class FullYearCourseCalculator extends StatelessWidget {
  const FullYearCourseCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Year Course"),
        leading: drawerIcon(),
      ),
      drawer: sideDrawer(context),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      //Fetches the calculated letter grade
                      context.watch<CourseCalculatorProvider>().letterGrade,
                      style: const TextStyle(fontSize: 60),
                    ),
                  ],
                ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 50),
                // ),
                const Text(
                  "*All grades are calculated\n using HCPSS Policy 8020.",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                ),
              ],
            ),
          ),
          greyLineBreak(),
          ListView.builder(
            shrinkWrap: true,
            itemCount:
                context.watch<CourseCalculatorProvider>().quarterValues.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 14, right: 14),
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
                                      .watch<CourseCalculatorProvider>()
                                      .quarterValues[index],
                                  onChanged: (String? value) {
                                    return context
                                        .read<CourseCalculatorProvider>()
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
              width: 178,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFADADAD),
                ),
                onPressed: () {
                  context.read<CourseCalculatorProvider>().resetGrade();
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
              width: 178,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                ),
                onPressed: () {
                  context.read<CourseCalculatorProvider>().CalculateGrade();
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
          ])
        ],
      ),
    );
  }
}
