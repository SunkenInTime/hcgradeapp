import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/icons.dart';
import 'package:hcgradeapp/constants/routes.dart';
import 'package:hcgradeapp/providers/full_course_calculator_provider.dart';
import 'package:hcgradeapp/providers/gpa_calculator_provider.dart';
import 'package:hcgradeapp/providers/semester_course_calculator_provider.dart';
import 'package:hcgradeapp/themes/theme_const.dart';
import 'package:hcgradeapp/views/fullyear.dart';
import 'package:hcgradeapp/views/gpa.dart';
import 'package:hcgradeapp/views/percentage.dart';
import 'package:hcgradeapp/views/semester.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
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
      theme: themeData,
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
    List<Widget> _buildScreens() {
      return [
        const FullYearCourseCalculator(),
        const SemesterCalculator(),
        const GPACalculator(),
        const PercentageCalculatorView(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
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
          activeColorPrimary: const Color(0xFF66C4E4),
          inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.black, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
      navBarHeight: 65,
    );
  }
}
