import 'package:flutter/material.dart';
import 'package:hcgradeapp/providers/gpa_calculator_provider.dart';
import 'package:provider/provider.dart';

import '../constants/const.dart';
import '../constants/icons.dart';
import '../themes/theme_const.dart';

class GPACalculator extends StatefulWidget {
  const GPACalculator({super.key});

  @override
  State<GPACalculator> createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  @override
  void dispose() {
    GpaProvider().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Calculator"),
        leading: drawerIcon(),
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          IconButton(
            icon: context.watch<GpaProvider>().editMode
                ? const Icon(CustomIcons.eye)
                : const Icon(Icons.edit_rounded),
            onPressed: () {
              context.read<GpaProvider>().toggleMode();
            },
          ),
        ],
      ),
      drawer: sideDrawer(context),
      body: editAndViewMode(context),
    );
  }
}

Widget editAndViewMode(BuildContext context) {
  final ScrollController scrollController = ScrollController();

// This is what you're looking for!
  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  if (context.watch<GpaProvider>().editMode) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "Your GPA",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                  Text(
                    context.watch<GpaProvider>().gpaValue,
                    style: const TextStyle(
                        fontSize: 50,
                        fontFamily: "SF Pro Text",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Text(
                "*All grades are calculated\n using HCPSS Policy 8020.",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
            ],
          ),
        ),
        // greyLineBreak(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.52,
          // width: 413,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 39,
                      width: 169,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: mainColor,
                        ),
                        onPressed: () {
                          context.read<GpaProvider>().addCourse();
                          scrollDown();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Add Course",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.watch<GpaProvider>().courseValues.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      final course =
                          context.watch<GpaProvider>().courseValues[index];
                      return Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 14, right: 14, bottom: 14),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.59,
                                  height: 42,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 42,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.black),
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
                                              items: listGradeOptions
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              value: course.letterGrade,
                                              onChanged: (String? value) {
                                                context
                                                    .read<GpaProvider>()
                                                    .updateCourse(
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.black),
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
                                              items: courseLevelOptions
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              value: course.level,
                                              onChanged: (String? value) {
                                                context
                                                    .read<GpaProvider>()
                                                    .updateCourse(
                                                      index,
                                                      Course(
                                                        letterGrade:
                                                            course.letterGrade,
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
                                    context
                                        .read<GpaProvider>()
                                        .removeCourse(index);
                                  },
                                  icon: const Icon(CustomIcons.weight_regular),
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                          if (index + 1 <
                              context.watch<GpaProvider>().courseValues.length)
                            greyLineBreak(),
                          // greyLineBreak(),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 49,
                width: MediaQuery.of(context).size.width * 0.42,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFADADAD),
                  ),
                  onPressed: () {
                    context.read<GpaProvider>().resetGPA();
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
                    context.read<GpaProvider>().calculateGPA();
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
          ),
        )
      ],
    );
  } else {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "Your GPA",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                  Text(
                    context.watch<GpaProvider>().gpaValue,
                    style: const TextStyle(
                        fontSize: 50,
                        fontFamily: "SF Pro Text",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Text(
                "*All grades are calculated\n using HCPSS Policy 8020.",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
            ],
          ),
        ),
        fullgreyLineBreak(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.52,
          // width: 413,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.watch<GpaProvider>().courseValues.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final course =
                          context.watch<GpaProvider>().courseValues[index];
                      return Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 14, right: 14, bottom: 10),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.59,
                                  height: 42,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 42,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.black),
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
                                              items: listGradeOptions
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              value: course.letterGrade,
                                              onChanged: (String? value) {
                                                context
                                                    .read<GpaProvider>()
                                                    .updateCourse(
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: Colors.black),
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
                                              items: courseLevelOptions
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              value: course.level,
                                              onChanged: (String? value) {
                                                context
                                                    .read<GpaProvider>()
                                                    .updateCourse(
                                                      index,
                                                      Course(
                                                        letterGrade:
                                                            course.letterGrade,
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
                              ],
                            ),
                          ),

                          // greyLineBreak(),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 49,
                width: MediaQuery.of(context).size.width * 0.42,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFADADAD),
                  ),
                  onPressed: () {
                    context.read<GpaProvider>().resetGPA();
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
                    context.read<GpaProvider>().calculateGPA();
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
          ),
        )
      ],
    );
  }
}
