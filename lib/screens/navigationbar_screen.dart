import 'package:flutter/material.dart';

import 'transactions/transactions_screen.dart';
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
      'title': 'Optankning',
    },
  ];

  Widget buildBottomBarIcon(IconData icon, int tabId) {
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
              buildBottomBarIcon(Icons.home, 0),
              buildBottomBarIcon(Icons.credit_card, 1),
              SizedBox(width: 60),
              buildBottomBarIcon(Icons.history, 2),
              buildBottomBarIcon(Icons.attach_money_sharp, 3),
            ],
          ),
        ),
      ),
    );
  }
}
