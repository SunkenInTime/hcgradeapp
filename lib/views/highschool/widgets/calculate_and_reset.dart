import 'package:flutter/material.dart';
import 'package:hcgradeapp/themes/theme_const.dart';

class CalculateAndReset extends StatelessWidget {
  const CalculateAndReset({
    super.key,
    required this.resetOnPressed,
    required this.calculateOnPressed,
  });
  final VoidCallback resetOnPressed;
  final VoidCallback calculateOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: 49,
        width: MediaQuery.of(context).size.width * 0.42,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(173, 173, 173, 1),
          ),
          onPressed: resetOnPressed,
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
          onPressed: calculateOnPressed,
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
    ]);
  }
}
