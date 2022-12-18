import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:rejsekort/models/cards/cards.dart';
import 'package:rejsekort/models/generate_ids.dart';
import 'package:rejsekort/models/dummy_data.dart';

import '../../screens/numpad.dart';
import 'transactions_screen.dart';

import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _Navigation_screenstate();
}

class _Navigation_screenstate extends State<NavigationScreen> {
  final List<Map<String, dynamic>> _screens = [
    {
      'page': HomeScreen(travelCards),
      'title': 'Hjemmeskærm',
    },
    {
      'page': NumPad(travelCards),
      'title': 'Optankning',
    },
    {
      'page': TransactionsScreen(),
      'title': 'Historik',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.blue.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 400,
          child: Center(
            child: Text('data'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 5,
        backgroundColor: Colors.grey[50],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () => _showBottomSheet(context),
              icon: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.blue,
              ),
            ),
          )
        ],
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade300,
            child: Text(
              'AA',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        foregroundColor: Theme.of(context).primaryColor,
        title: Text(_screens[_selectedPageIndex]['title']),
      ),
      // Animation ved ny page
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(1.5, 0.0),
            ).animate(secondaryAnimation),
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(primaryAnimation),
              child: child,
            ),
          );
        },
        child: Container(
          key: ValueKey<int>(_selectedPageIndex),
          child: _screens[_selectedPageIndex]['page'],
        ),
      ),
      // body: _screens[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Hjem',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: FaIcon(FontAwesomeIcons.arrowsRotate),
            label: 'Optank',
          ),
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
