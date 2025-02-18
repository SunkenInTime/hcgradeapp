import 'package:flutter/material.dart';

class GradeInfoBar extends StatelessWidget {
  const GradeInfoBar({
    super.key,
    required this.gradeValue,
    required this.isCalculated,
    this.fontSize,
  });
  final String gradeValue;
  final bool isCalculated;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                "Your grade",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "SF Pro Text",
                ),
              ),
              Text(
                //Fetches the calculated letter grade
                gradeValue,
                style: TextStyle(
                    fontSize: fontSize ?? 60,
                    fontFamily: "SF Pro Text",
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                "*All grades are calculated\n using HCPSS Policy 8020.",
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
              const Padding(padding: EdgeInsets.only(top: 3)),
              isCalculated
                  ? const SizedBox(
                      width: 0,
                      height: 0,
                    )
                  : const Text(
                      "Changes have not \n been calculated.",
                      style: TextStyle(color: Colors.red),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
