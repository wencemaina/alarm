import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmSettingsScreen extends StatefulWidget {
  const AlarmSettingsScreen({super.key});

  @override
  State<AlarmSettingsScreen> createState() => _AlarmSettingsScreenState();
}

class _AlarmSettingsScreenState extends State<AlarmSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
