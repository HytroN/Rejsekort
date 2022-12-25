import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rejsekort/widgets/navigation_screen_widgets/bottom_navigation.dart';

import 'numpad_screen.dart';
import 'transactions_screen.dart';

import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String email = '';
  String firstname = '';
  String lastname = '';

  void _getdata() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .snapshots()
        .listen((userData) {
      setState(() {
        email = userData.data()?['email'];
        firstname = userData.data()?['firstname'];
        lastname = userData.data()?['lastname'];
      });
    });
  }

  void createTravelCard(String selectedCard) async {
    if (selectedCard == 'Pendlerkort' ||
        selectedCard == 'Skolekort' ||
        selectedCard == 'Ungdomskort') {
      DocumentReference ref = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('cards')
          .add({
        'money': null,
        'type': selectedCard.toLowerCase(),
        'timestamp': Timestamp.now(),
      });

      String documentId = ref.id;

      await ref.set({
        'id': documentId,
        'money': null,
        'type': selectedCard.toLowerCase(),
        'timestamp': Timestamp.now(),
      });
    } else if (selectedCard == 'Erhvervskort') {
      DocumentReference ref = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('cards')
          .add({
        'money': 0,
        'type': selectedCard.toLowerCase(),
        'timestamp': Timestamp.now(),
      });

      String documentId = ref.id;

      await ref.set({
        'id': documentId,
        'image': 'assets/images/$selectedCard.png',
        'money': 0,
        'type': selectedCard.toLowerCase(),
        'timestamp': Timestamp.now(),
      });
    }
  }

  @override
  void initState() {
    _getdata();
    // TODO: implement initState
    super.initState();
  }

  String? selectedValue;
  final List<String> cardType = [
    'Pendlerkort',
    'Skolekort',
    'Erhvervskort',
    'Ungdomskort',
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> _screens = [
    {
      'page': HomeScreen(),
      'title': 'Hjemmeskærm',
    },
    {
      'page': NumPadScreen(),
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
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                accountName: Text(
                  '${firstname} ${lastname}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                accountEmail: Text(
                  '${email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    firstname.length > 0
                        ? '${firstname[0]}${lastname[0]}'
                        : 'ERROR',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  radius: 40.0,
                ),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.rightFromBracket),
                title: const Text('Log ud'),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
            ],
          ),
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
                firstname.length > 0
                    ? '${firstname[0]}${lastname[0]}'
                    : 'ERROR',
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
      floatingActionButton: Visibility(
        visible: _selectedPageIndex == 0,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            animationDuration: Duration.zero,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return AlertDialog(
                    title: Text(
                      'Føj et kort til kontoen',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          print(selectedValue);
                          createTravelCard(selectedValue as String);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                    content: CustomDropdownButton2(
                      iconEnabledColor: Colors.blue.shade500,
                      buttonDecoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade500,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: FaIcon(FontAwesomeIcons.arrowDown),
                      buttonWidth: double.infinity,
                      hint: 'Vælg kort',
                      dropdownItems: cardType,
                      value: selectedValue,
                      onChanged: (value) {
                        setState(
                          () {
                            selectedValue = value;
                          },
                        );
                      },
                    ),
                  );
                });
              },
            );
          },
          icon: FaIcon(
            FontAwesomeIcons.plus,
            size: 18,
          ),
          label: Text('Føj kort til appen'),
        ),
      ),
    );
  }
}
