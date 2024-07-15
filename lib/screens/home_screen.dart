import 'package:alarm/data/database_helper.dart';
import 'package:alarm/models/alarm.dart';
import 'package:alarm/screens/set_alarm_screen.dart';
import 'package:alarm/screens/settings_screen.dart';
import 'package:alarm/widgets/alarm_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Alarm> _alarms = alarmData;
  int _selectedIndex = 0;

  void _onDaySelected(String day, String alarmName) {
    setState(() {
      final alarm = _alarms.firstWhere((a) => a.name == alarmName);
      if (alarm.selectedDays.contains(day)) {
        alarm.selectedDays.remove(day);
      } else {
        alarm.selectedDays.add(day);
      }
    });
  }

  void _onSwitchChanged(bool value, String alarmName) {
    setState(() {
      final alarm = _alarms.firstWhere((a) => a.name == alarmName);
      alarm.light = value;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation or other actions here
    // For now, we are just updating the selected index
  }

  void _onAddAlarm() {
    // Handle adding a new alarm here
    // For now, we are just printing a message
    print("Add new alarm");
  }

  void goToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetAlarmScreen()), // Pass the function
    );
  }

  void alarmSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const AlarmSettingsScreen()), // Pass the function
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Alarms",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        itemCount: _alarms.length,
        itemBuilder: (context, index) {
          final alarm = _alarms[index];
          return Column(
            children: [
              AlarmCard(
                alarm: alarm,
                onDaySelected: _onDaySelected,
                onSwitchChanged: _onSwitchChanged,
              ),
              const SizedBox(height: 8.0),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50.0,
        color: Color.fromARGB(255, 9, 9, 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                CupertinoIcons.home,
                size: 30.0,
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                CupertinoIcons.add_circled_solid,
                size: 30.0,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                goToSettings();
                _onItemTapped(1);
              },
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                CupertinoIcons.settings_solid,
                size: 30.0,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                alarmSettings();
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
