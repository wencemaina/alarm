import 'package:flutter/material.dart';

class CircularProgressWidget extends StatefulWidget {
  final TimeOfDay alarmTime;

  const CircularProgressWidget({Key? key, required this.alarmTime})
      : super(key: key);

  @override
  _CircularProgressWidgetState createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget> {
  double _progressValue = 0.0;
  late DateTime _alarmDateTime;

  @override
  void initState() {
    super.initState();
    _initializeAlarmTime();
    _updateProgress();
  }

  void _initializeAlarmTime() {
    final now = DateTime.now();
    _alarmDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      widget.alarmTime.hour,
      widget.alarmTime.minute,
    );

    // If the alarm time is before the current time, it means the alarm is for the next day
    if (_alarmDateTime.isBefore(now)) {
      _alarmDateTime = _alarmDateTime.add(const Duration(days: 1));
    }
  }

  void _updateProgress() {
    setState(() {
      final now = DateTime.now();
      final remainingDuration = _alarmDateTime.difference(now);
      final totalDuration = Duration(
                hours: widget.alarmTime.hour,
                minutes: widget.alarmTime.minute,
              ).compareTo(Duration(hours: 12)) >
              0
          ? const Duration(hours: 24)
          : const Duration(
              hours: 12,
              minutes: 0,
            );

      if (remainingDuration.isNegative) {
        _progressValue = 1.0;
      } else {
        _progressValue = 1 -
            (remainingDuration.inMilliseconds / totalDuration.inMilliseconds);
      }
    });

    // Update progress every 50 milliseconds
    Future.delayed(const Duration(milliseconds: 50), _updateProgress);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: CircularProgressIndicator(
            value: _progressValue,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            strokeWidth: 10.0,
          ),
        ),
        Text(
          '${_alarmDateTime.hour.toString().padLeft(2, '0')}:${_alarmDateTime.minute.toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
