import 'package:flutter/material.dart';

class DayButton extends StatelessWidget {
  final String identifier;
  final String day;
  final bool isSelected;
  final Function(String) onDaySelected;

  const DayButton({
    Key? key,
    required this.identifier,
    required this.day,
    required this.isSelected,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onDaySelected(identifier),
      child: Container(
        width: 27.0, // Set the width
        height: 27.0, // Set the height
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(
              35.0 / 2), // Set the borderRadius to half of the width/height
        ),
        child: Text(
          day,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
