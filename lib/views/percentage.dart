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
  String letterGradeValue = "A";
  final TextEditingController _givenScoreValueController =
      TextEditingController();
  final TextEditingController _totalScoreValueController =
      TextEditingController();
  Color givenGreyOutline = const Color.fromARGB(255, 167, 167, 167);
  Color givenBlueOutline = Colors.blue;
  Color totalGreyOutline = const Color.fromARGB(255, 167, 167, 167);
  Color totalBlueOutline = Colors.blue;
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
            letterGradeValue,
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
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: givenGreyOutline, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: givenBlueOutline, width: 2)),
                    contentPadding: const EdgeInsets.all(10.0),
                    hintText: "10",
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (e) {
                    if (_givenScoreValueController.text.isEmpty ||
                        _totalScoreValueController.text.isEmpty) {
                      setState(() {
                        percentageValue = "100.00%";
                        letterGradeValue = "A";
                      });
                    }
                    if (!isNumber(_givenScoreValueController.text)) {
                      setState(() {
                        givenGreyOutline = Colors.red.shade700;
                        givenBlueOutline = Colors.red.shade700;
                      });
                      return;
                    }
                    setState(() {
                      givenGreyOutline =
                          const Color.fromARGB(255, 167, 167, 167);
                      givenBlueOutline = Colors.blue;
                    });
                    if (!isNumber(_totalScoreValueController.text)) return;
                    List<String> letterAndNum = calculatePercentage(
                        double.parse(_givenScoreValueController.text),
                        double.parse(_totalScoreValueController.text));
                    setState(() {
                      percentageValue = letterAndNum[0];
                      letterGradeValue = letterAndNum[1];
                    });
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
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: totalGreyOutline, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: totalBlueOutline, width: 2)),
                    contentPadding: const EdgeInsets.all(10.0),
                    hintText: "10",
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (_givenScoreValueController.text.isEmpty ||
                        _totalScoreValueController.text.isEmpty) {
                      setState(() {
                        percentageValue = "100.00%";
                        letterGradeValue = "A";
                      });
                    }
                    if (!isNumber(_totalScoreValueController.text)) {
                      setState(() {
                        totalGreyOutline = Colors.red.shade700;
                        totalBlueOutline = Colors.red.shade700;
                      });
                      return;
                    }
                    setState(() {
                      totalGreyOutline =
                          const Color.fromARGB(255, 167, 167, 167);
                      totalBlueOutline = Colors.blue;
                    });
                    if (!isNumber(_givenScoreValueController.text)) return;
                    List<String> letterAndNum = calculatePercentage(
                        double.parse(_givenScoreValueController.text),
                        double.parse(_totalScoreValueController.text));
                    setState(() {
                      percentageValue = letterAndNum[0];
                      letterGradeValue = letterAndNum[1];
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
