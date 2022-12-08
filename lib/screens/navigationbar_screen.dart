import 'package:flutter/material.dart';

import '../../screens/transactions_screen.dart';
import 'chat.dart';
import 'dashboard.dart';
import 'setting.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentTap = 0;
  final List<Map<String, dynamic>> screens = [
    {
      'page': DashBoard(),
      'title': 'Dashboard',
    },
    {
      'page': Chat(),
      'title': 'Chat',
    },
    {
      'page': TransactionsScreen(),
      'title': 'Historik',
    },
    {
      'page': Setting(),
      'title': 'Settings',
    },
  ];

  Widget buildBottomBarIcon(String text, IconData icon, int tabId) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              currentTap = tabId;
            });
          },
          icon: Icon(
            icon,
            color: currentTap == tabId ? Colors.blue : Colors.grey,
          ),
        )
      ],
    );
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashBoard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        title: Text(screens[currentTap]['title']),
        centerTitle: true,
      ),
      body: PageStorage(
        child: screens[currentTap]['page'],
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.contactless_outlined,
          size: 40,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildBottomBarIcon('Hjem', Icons.home, 0),
              buildBottomBarIcon('Kort', Icons.credit_card, 1),
              SizedBox(width: 40),
              buildBottomBarIcon('Historik', Icons.history, 2),
              buildBottomBarIcon('Indstillinger', Icons.settings, 3),
            ],
          ),
        ),
      ),
    );
  }
}
