import 'package:alarm/models/alarm.dart';
import 'package:flutter/material.dart';

// Dummy data for alarms
final List<Alarm> alarmData = [
  Alarm(
    name: 'Morning Alarm',
    setTime: const TimeOfDay(hour: 5, minute: 50),
    selectedDays: {'Mon', 'Tue', 'Wed', 'Thu', 'Fri'},
    light: true,
    period: 'PM', // Example: Alarm set for 7:00 AM
  ),
  Alarm(
    name: 'Weekend Reminder',
    setTime: const TimeOfDay(hour: 8, minute: 30),
    selectedDays: {'Sat', 'Sun'},
    light: false,
    period: 'PM', // Example: Alarm set for 8:30 PM
  ),
  Alarm(
    name: 'Daily Check',
    setTime: const TimeOfDay(hour: 8, minute: 30),
    selectedDays: {'Mon', 'Tue', 'Wed', 'Thu', 'Fri'},
    light: false,
    period: 'AM', // Example: Alarm set for 8:30 AM
  ),
  Alarm(
    name: 'Evening Reminder',
    setTime: const TimeOfDay(hour: 6, minute: 45),
    selectedDays: {'Mon', 'Wed', 'Fri'},
    light: true,
    period: 'PM', // Example: Alarm set for 6:45 PM
  ),
];
