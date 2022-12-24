import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
