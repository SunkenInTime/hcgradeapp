import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/const.dart';
import '../../themes/theme_const.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            "Percentage Calculator",
            style: TextStyle(color: Colors.white),
          ),
          leading: drawerIcon(),
          centerTitle: true,
          toolbarHeight: 70,
          backgroundColor: mainColor,
        ),
        drawer: sideDrawer(context),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                        borderSide:
                            BorderSide(color: givenGreyOutline, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: givenBlueOutline, width: 2)),
                      contentPadding: const EdgeInsets.all(10.0),
                      hintText: "10",
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (e) {},
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
                        borderSide:
                            BorderSide(color: totalGreyOutline, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: totalBlueOutline, width: 2)),
                      contentPadding: const EdgeInsets.all(10.0),
                      hintText: "10",
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: 49,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFADADAD),
                      ),
                      onPressed: () {
                        _givenScoreValueController.text = "";
                        _totalScoreValueController.text = "";
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
                        } else if (!isNumber(_totalScoreValueController.text)) {
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
                        setState(() {
                          givenGreyOutline =
                              const Color.fromARGB(255, 167, 167, 167);
                          givenBlueOutline = Colors.blue;
                        });
                        if (!isNumber(_totalScoreValueController.text)) return;
                        setState(() {
                          letterGradeValue = calculatePercentage(
                              double.parse(_givenScoreValueController.text),
                              double.parse(_totalScoreValueController.text))[1];
                          percentageValue = calculatePercentage(
                              double.parse(_givenScoreValueController.text),
                              double.parse(_totalScoreValueController.text))[0];
                        });
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
        ),
      ),
    );
  }
}
