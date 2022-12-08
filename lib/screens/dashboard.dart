// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("dashboard screen", style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
