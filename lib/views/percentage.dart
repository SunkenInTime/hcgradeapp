import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/const.dart';

class PercentageCalculatorView extends StatefulWidget {
  const PercentageCalculatorView({super.key});

  @override
  State<PercentageCalculatorView> createState() =>
      _PercentageCalculatorViewState();
}

class _PercentageCalculatorViewState extends State<PercentageCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Percentage Calculator"),
      ),
      drawer: sideDrawer(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 60,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 167, 167, 167), width: 1),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "/",
                style: TextStyle(fontSize: 28),
              ),
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 60,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 167, 167, 167), width: 1),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
