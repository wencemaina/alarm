import 'package:alarm/models/alarm.dart';

import 'package:alarm/widgets/circular_progress_widget.dart.dart';
import 'package:alarm/widgets/day_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmCard extends StatefulWidget {
  final Alarm alarm;
  final Function(String, String) onDaySelected;
  final Function(bool, String) onSwitchChanged;

  const AlarmCard({
    Key? key,
    required this.alarm,
    required this.onDaySelected,
    required this.onSwitchChanged,
  }) : super(key: key);

  @override
  _AlarmCardState createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat('h:mm'); // Remove the period format here
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = formatTimeOfDay(widget.alarm.setTime);

    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 10, 12, 24),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.alarm.name, // Display alarm name here
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Row(
              children: <Widget>[
                Text(
                  '$formattedTime', // Display formatted time without period
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' ${widget.alarm.period}', // Display period here
                  style: const TextStyle(
                    fontSize: 20, // Adjusted font size for period
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                // Replace CircularProgressWidget with any widget if needed
                CircularProgressWidget(alarmTime: widget.alarm.setTime),
                const SizedBox(width: 5.0),
              ],
            ),
            const Spacer(),
            Row(
              children: <Widget>[
                DayButton(
                  identifier: "Mon",
                  day: "M",
                  isSelected: widget.alarm.selectedDays.contains("Mon"),
                  onDaySelected: (day) =>
                      widget.onDaySelected(day, widget.alarm.name),
                ),
                const SizedBox(width: 4.0),
                DayButton(
                  identifier: "Tue",
                  day: "T",
                  isSelected: widget.alarm.selectedDays.contains("Tue"),
                  onDaySelected: (day) =>
                      widget.onDaySelected(day, widget.alarm.name),
                ),
                const SizedBox(width: 4.0),
                DayButton(
                  identifier: "Wed",
                  day: "W",
                  isSelected: widget.alarm.selectedDays.contains("Wed"),
                  onDaySelected: (day) =>
                      widget.onDaySelected(day, widget.alarm.name),
                ),
                const SizedBox(width: 4.0),
                DayButton(
                  identifier: "Thu",
                  day: "T",
                  isSelected: widget.alarm.selectedDays.contains("Thu"),
                  onDaySelected: (day) =>
                      widget.onDaySelected(day, widget.alarm.name),
                ),
                const SizedBox(width: 4.0),
                DayButton(
                  identifier: "Fri",
                  day: "F",
                  isSelected: widget.alarm.selectedDays.contains("Fri"),
                  onDaySelected: (day) =>
                      widget.onDaySelected(day, widget.alarm.name),
                ),
                const SizedBox(width: 4.0),
                DayButton(
                  identifier: "Sat",
                  day: "S",
                  isSelected: widget.alarm.selectedDays.contains("Sat"),
                  onDaySelected: (day) =>
                      widget.onDaySelected(day, widget.alarm.name),
                ),
                const SizedBox(width: 4.0),
                DayButton(
                  identifier: "Sun",
                  day: "S",
                  isSelected: widget.alarm.selectedDays.contains("Sun"),
                  onDaySelected: (day) =>
                      widget.onDaySelected(day, widget.alarm.name),
                ),
                const Spacer(),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: widget.alarm.light,
                    activeColor: const Color.fromRGBO(23, 77, 205, 1),
                    onChanged: (value) =>
                        widget.onSwitchChanged(value, widget.alarm.name),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
