/* import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          children: <Widget>[
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("This is the Alarm Name"),
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Text("The set hour"),
                        Spacer(),
                        Text("The chart bar circle"),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Text("M"),
                        SizedBox(width: 30.0),
                        Text("T"),
                        SizedBox(width: 30.0),
                        Text("W"),
                        SizedBox(width: 30.0),
                        Text("T"),
                        SizedBox(width: 30.0),
                        Text("F"),
                        SizedBox(width: 30.0),
                        Text("S"),
                        SizedBox(width: 30.0),
                        Text("S"),
                        SizedBox(width: 30.0),
                      ],
                    ),
                    Text("Another row with the toggle on and off and days"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.amber[500],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Column(
                // Use Column for vertical arrangement
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Evenly distribute vertically
                children: <Widget>[
                  Text('Entry B Title', style: TextStyle(fontSize: 18.0)),
                  Text('This is a description for Entry B.',
                      textAlign: TextAlign.justify),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.star, color: Colors.yellow),
                  ),
                  Expanded(
                    // Fills remaining horizontal space proportionally
                    child: Text('Entry C'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
 */

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<String> _selectedDays = {};

  bool light = true;

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.amber[600],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("This is the Alarm Name"),
                  const SizedBox(height: 8.0),
                  const Row(
                    children: const <Widget>[
                      Text("The set hour"),
                      Spacer(),
                      Text("The chart bar circle"),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      _buildDayButton("Mon", "M"),
                      const SizedBox(width: 4.0),
                      _buildDayButton("Tue", "T"),
                      const SizedBox(width: 4.0),
                      _buildDayButton("Wed", "W"),
                      const SizedBox(width: 4.0),
                      _buildDayButton("Thu", "T"),
                      const SizedBox(width: 4.0),
                      _buildDayButton("Fri", "F"),
                      const SizedBox(width: 4.0),
                      _buildDayButton("Sat", "S"),
                      const SizedBox(width: 4.0),
                      _buildDayButton("Sun", "S"),
                      /* const SizedBox(width: 4.0), */
                      const Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: light,
                          activeColor: const Color.fromRGBO(23, 77, 205, 1),
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text("Another row with the toggle on and off and days"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.amber[500],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Entry B Title', style: TextStyle(fontSize: 18.0)),
                Text('This is a description for Entry B.',
                    textAlign: TextAlign.justify),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.star, color: Colors.yellow),
                ),
                Expanded(
                  child: Text('Entry C'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayButton(String identifier, String day) {
    final bool isSelected = _selectedDays.contains(identifier);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedDays.remove(identifier);
          } else {
            _selectedDays.add(identifier);
          }
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
