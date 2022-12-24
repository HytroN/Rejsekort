import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:rejsekort/models/cards/cards.dart';
import 'package:rejsekort/models/generate_ids.dart';
import 'package:rejsekort/models/dummy_data.dart';
import 'package:rejsekort/widgets/navigation_screen_widgets/bottom_navigation.dart';

import '../../screens/numpad.dart';
import 'transactions_screen.dart';

import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _Navigation_screenstate();
}

class _Navigation_screenstate extends State<NavigationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Log ud'),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
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
                FontAwesomeIcons.userPlus,
                color: Colors.blue,
              ),
            ),
          )
        ],
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.blue.shade300,
              child: Text(
                'AA',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ),
        foregroundColor: Theme.of(context).primaryColor,
        title: Text(_screens[_selectedPageIndex]['title']),
      ),
      // Animation ved ny page
      body: _screens[_selectedPageIndex]['page'],

      // body: _screens[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigation(_selectedPageIndex, _selectPage),
    );
  }
}
