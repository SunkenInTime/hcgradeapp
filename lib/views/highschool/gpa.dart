import 'package:flutter/material.dart';
import 'package:hcgradeapp/providers/highschool/gpa_calculator_provider.dart';
import 'package:hcgradeapp/views/highschool/explainHowGPAView.dart';
import 'package:hcgradeapp/views/highschool/widgets/calculate_and_reset.dart';
import 'package:hcgradeapp/views/highschool/widgets/course_tile.dart';
import 'package:hcgradeapp/views/highschool/widgets/edit_course_tile.dart';
import 'package:hcgradeapp/views/highschool/widgets/grade_info_bar.dart';
import 'package:provider/provider.dart';

import '../../constants/const.dart';
import '../../constants/icons.dart';
import '../../themes/theme_const.dart';

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
    final ScrollController scrollController = ScrollController();
    GpaProvider provider = context.watch<GpaProvider>();

    void scrollDown() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GPA Calculator",
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
                      const ExplainHowGPAView(),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            icon: const Icon(Icons.question_mark_rounded),
          ),
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
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Column(
        children: [
          GradeInfoBar(
            gradeValue: context.watch<GpaProvider>().gpaValue,
            isCalculated: provider.isCalculated,
            fontSize: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.52,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (context.watch<GpaProvider>().editMode)
                          ? SizedBox(
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
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          context.watch<GpaProvider>().courseValues.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final course =
                            context.watch<GpaProvider>().courseValues[index];

                        if (context.watch<GpaProvider>().editMode) {
                          return CourseTile(index: index, course: course);
                        } else {
                          return EditCourseTile(index: index, course: course);
                        }
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: CalculateAndReset(
                resetOnPressed: () {
                  context.read<GpaProvider>().resetGPA();
                },
                calculateOnPressed: () {
                  context.read<GpaProvider>().calculateGPA();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
