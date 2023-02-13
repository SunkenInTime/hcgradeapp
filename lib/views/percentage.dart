import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/const.dart';

class PercentageCalculatorView extends StatefulWidget {
  const PercentageCalculatorView({super.key});

  @override
  State<PercentageCalculatorView> createState() =>
      _PercentageCalculatorViewState();
}

class _PercentageCalculatorViewState extends State<PercentageCalculatorView> {
  String percentageValue = "100.00%";
  String letterGrade = "A";
  final TextEditingController _givenScoreValueController =
      TextEditingController();
  final TextEditingController _totalScoreValueController =
      TextEditingController();

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
          Text(
            letterGrade,
            style: const TextStyle(fontSize: 70),
          ),
          Text(percentageValue),
          const Padding(padding: EdgeInsets.all(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 50,
                child: TextField(
                  controller: _givenScoreValueController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 167, 167, 167), width: 1),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "8",
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (e) {
                    if (_givenScoreValueController.text.isEmpty) return;
                    if (!isNumber(_givenScoreValueController.text)) return;
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const Text(
                "/",
                style: TextStyle(fontSize: 28),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 60,
                height: 50,
                child: TextField(
                  controller: _totalScoreValueController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 167, 167, 167), width: 1),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: "10",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
