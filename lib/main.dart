import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/icons.dart';
import 'package:hcgradeapp/constants/routes.dart';
import 'package:hcgradeapp/providers/highschool/full_course_calculator_provider.dart';
import 'package:hcgradeapp/providers/highschool/gpa_calculator_provider.dart';
import 'package:hcgradeapp/providers/highschool/school_level_provider.dart';
import 'package:hcgradeapp/providers/highschool/semester_course_calculator_provider.dart';
import 'package:hcgradeapp/providers/middleschool/full_course_calculator_provider.dart';
import 'package:hcgradeapp/providers/middleschool/semester_course_calculator_provider.dart';
import 'package:hcgradeapp/themes/theme_const.dart';
import 'package:hcgradeapp/views/highschool/fullyear.dart';
import 'package:hcgradeapp/views/highschool/gpa.dart';
import 'package:hcgradeapp/views/highschool/percentage.dart';
import 'package:hcgradeapp/views/highschool/semester.dart';
import 'package:hcgradeapp/views/middleschool/fullyear.dart';
import 'package:hcgradeapp/views/middleschool/gpa.dart';
import 'package:hcgradeapp/views/middleschool/semester.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


import 'package:provider/provider.dart';

import 'constants/const.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Course>("courseBox");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CourseCalculatorProvider()),
      ChangeNotifierProvider(create: (_) => SemesterCourseProvider()),
      ChangeNotifierProvider(create: (_) => GpaProvider()),
      ChangeNotifierProvider(create: (_) => SchoolLevelProvider()),
      ChangeNotifierProvider(
          create: (_) => MiddleSchoolCourseCalculatorProvider()),
      ChangeNotifierProvider(
          create: (_) => MiddleSchoolSemesterCourseProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: highschoolThemeData,
      home: const BottomNavBar(),
      routes: {
        courseCalculatorRoute: (context) => const FullYearCourseCalculator(),
        semesterCalculatorRoute: (context) => const SemesterCalculator(),
        gpaCalculatorRoute: (context) => const GPACalculator(),
        percentageCalculatorRoute: (context) =>
            const PercentageCalculatorView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);
    List<Widget> highSchoolBuildScreens() {
      return [
        const FullYearCourseCalculator(),
        const SemesterCalculator(),
        const GPACalculator(),
        const PercentageCalculatorView(),
      ];
    }

    List<Widget> middleSchoolBuildScreens() {
      return [
        const MiddleFullYearCourseCalculator(),
        const MiddleSemesterCalculator(),
        const MiddleGPACalculator(),
        const PercentageCalculatorView(),
      ];
    }

    List<PersistentBottomNavBarItem> highSchoolNavBarsItems() {
      return [
        PersistentBottomNavBarItem(
            icon: const Icon(CustomIcons.vector),
            title: ("Full Year"),
            activeColorPrimary: const Color(0xFF66C4E4),
            inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
            iconSize: 22),
        PersistentBottomNavBarItem(
          icon: const Icon(CustomIcons.bookopentext),
          title: ("Semester"),
          activeColorPrimary: const Color(0xFF66C4E4),
          inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CustomIcons.mathoperations),
          title: ("GPA"),
          activeColorPrimary: const Color(0xFF66C4E4),
          inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CustomIcons.percent),
          title: ("Percentage"),
          activeColorPrimary: const Color.fromRGBO(102, 196, 228, 1),
          inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        ),
      ];
    }

    List<PersistentBottomNavBarItem> middleSchoolNavBarsItems() {
      return [
        PersistentBottomNavBarItem(
            icon: const Icon(CustomIcons.vector),
            title: ("Full Year"),
            activeColorPrimary: const Color(0xFFFF3366),
            inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
            iconSize: 22),
        PersistentBottomNavBarItem(
          icon: const Icon(CustomIcons.bookopentext),
          title: ("Semester"),
          activeColorPrimary: const Color(0xFFFF3366),
          inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CustomIcons.mathoperations),
          title: ("GPA"),
          activeColorPrimary: const Color(0xFFFF3366),
          inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CustomIcons.percent),
          title: ("Percentage"),
          activeColorPrimary: const Color(0xFFFF3366),
          inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        ),
      ];
    }

    if (context.watch<SchoolLevelProvider>().schoolLevel == "middle") {
      log("Middle schoool losers");
      return PersistentTabView(
        context,
        controller: controller,
        screens: middleSchoolBuildScreens(),
        items: middleSchoolNavBarsItems(),
        
        backgroundColor: Colors.black, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
         // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.black,
        ),
        
        navBarStyle:
            NavBarStyle.style9, // Choose the nav bar style with this property.
        navBarHeight: 65,
      );
    } else {
      log("Pro highschoolers");
      return PersistentTabView(
        context,
        controller: controller,
        screens: highSchoolBuildScreens(),
        items: highSchoolNavBarsItems(),
        

        backgroundColor: Colors.black, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.black,
        ),
       
    
        navBarStyle:
            NavBarStyle.style9, // Choose the nav bar style with this property.
        navBarHeight: 65,
      );
    }
  }
}
