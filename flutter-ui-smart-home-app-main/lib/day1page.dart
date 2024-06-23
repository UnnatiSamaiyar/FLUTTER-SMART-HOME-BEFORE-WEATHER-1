import 'package:flutter/material.dart';

class Day1Page extends StatelessWidget {
  final Map<String, dynamic> day1info;

  Day1Page({required Key key, required this.day1info}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day 1 Weather2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Temperature: ${day1info['avgtemp_c']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add your content specific to Day 1 here
          ],
        ),
      ),
    );
  }
}
