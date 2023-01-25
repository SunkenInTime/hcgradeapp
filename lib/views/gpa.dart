import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/routes.dart';

class GPACalculator extends StatefulWidget {
  const GPACalculator({super.key});

  @override
  State<GPACalculator> createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPA Calculator"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 80,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Full Year Course",
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(courseCalculatorRoute);
              },
              leading: const Icon(Icons.menu_book_rounded),
            ),
            ListTile(
              title: const Text(
                "Semester Courses",
                style: TextStyle(fontSize: 15),
              ),
              leading: const Icon(Icons.book),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    semesterCalculatorRoute, (route) => false);
              },
            ),
            ListTile(
                title: const Text(
                  "GPA Calculator",
                  style: TextStyle(fontSize: 15),
                ),
                leading: Icon(Icons.calculate_outlined),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      gpaCalculatorRoute, (route) => false);
                })
          ],
        ),
      ),
    );
  }
}
