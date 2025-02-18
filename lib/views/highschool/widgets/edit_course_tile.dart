import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/const.dart';
import 'package:hcgradeapp/constants/icons.dart';
import 'package:hcgradeapp/providers/highschool/gpa_calculator_provider.dart';
import 'package:provider/provider.dart';

class EditCourseTile extends StatelessWidget {
  const EditCourseTile({super.key, required this.index, required this.course});
  final int index;
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 14, right: 14, bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Course ${index + 1}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Letter grade
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.59,
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                            value: course.letterGrade,
                            onChanged: (String? value) {
                              context.read<GpaProvider>().updateCourse(
                                    index,
                                    Course(
                                      letterGrade: value,
                                      level: course.level,
                                    ),
                                  );
                            },
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ), // Set the font size and color here
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width * 0.32,
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
                            items: courseLevelOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: course.level,
                            onChanged: (String? value) {
                              context.read<GpaProvider>().updateCourse(
                                    index,
                                    Course(
                                      letterGrade: course.letterGrade,
                                      level: value,
                                    ),
                                  );
                            },
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ), // Set the font size and color here
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<GpaProvider>().removeCourse(index);
                },
                icon: const Icon(
                  CustomIcons.weightRegular,
                  color: Colors.red,
                ),
                color: Colors.red,
              )
            ],
          ),
        ),
        if (index + 1 < context.watch<GpaProvider>().courseValues.length)
          greyLineBreak(),

        // greyLineBreak(),
      ],
    );
  }
}
