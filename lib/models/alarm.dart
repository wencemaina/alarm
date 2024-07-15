import 'package:flutter/material.dart';

class Alarm {
  final String name;
  final TimeOfDay setTime;
  final Set<String> selectedDays;
  bool light;
  final String period;

  Alarm({
    required this.name,
    required this.setTime,
    required this.selectedDays,
    required this.light,
    required this.period,
  });

  // Factory method to create an Alarm from a Map
  factory Alarm.fromMap(Map<String, dynamic> map) {
    return Alarm(
      name: map['name'],
      setTime: map['setTime'],
      selectedDays: Set<String>.from(map['selectedDays']),
      light: map['light'],
      period: map['period'],
    );
  }

  // Method to convert an Alarm to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'setTime': setTime,
      'selectedDays': selectedDays.toList(),
      'light': light,
      'period': period,
    };
  }
}
