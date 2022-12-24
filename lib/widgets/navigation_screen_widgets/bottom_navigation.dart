import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final int pageIndex;
  final Function(int index) selectPage;

  BottomNavigation(this.pageIndex, this.selectPage);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: pageIndex,
      onTap: selectPage,
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
    );
  }
}
