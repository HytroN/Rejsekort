import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

import '../../screens/numpad.dart';
import '../../screens/transactions_list_screen.dart';

import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _Navigation_screenstate();
}

class _Navigation_screenstate extends State<NavigationScreen> {
  final List<Map<String, dynamic>> _screens = [
    {
      'page': HomeScreen(),
      'title': 'Hjemmeskærm',
    },
    // {
    //   'page': TransactionsScreen(),
    //   'title': 'Historik',
    // },
    {
      'page': NumPad(),
      'title': 'Optankning',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        title: Text(_screens[_selectedPageIndex]['title']),
        centerTitle: true,
      ),
      body: _screens[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Hjem',
          ),
          // BottomNavigationBarItem(
          //   backgroundColor: Theme.of(context).primaryColor,
          //   icon: FaIcon(FontAwesomeIcons.arrowsRotate),
          //   label: 'Optank',
          // ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
            label: 'Historik',
          ),
        ],
      ),
    );
  }
}
