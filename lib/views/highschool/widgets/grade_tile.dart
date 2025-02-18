import 'package:flutter/material.dart';
import 'package:hcgradeapp/constants/const.dart';
import '../../../constants/icons.dart';

class GradeTile extends StatelessWidget {
  const GradeTile({
    super.key,
    required this.title,
    required this.grade,
    required this.onChanged,
  });

  final String title;
  final String? grade;
  final Function(String? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 14, right: 14, bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 42,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: const Icon(
                        CustomIcons.caretdownicon,
                        size: 16,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      items: listGradeOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: grade,
                      onChanged: onChanged,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ), // Set the font size and color here
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        greyLineBreak(),
      ],
    );
  }
}
