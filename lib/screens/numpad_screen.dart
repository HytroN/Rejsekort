import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/numpad/numpad_widget.dart';

class NumPadScreen extends StatefulWidget {
  @override
  _NumPadScreenState createState() => _NumPadScreenState();
}

class _NumPadScreenState extends State<NumPadScreen> {
  // String? selectedValue;
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? selectedValue;
  final List<String> cardType = [
    'Rejsekort',
    'Erhvervskort',
  ];

  void deleteText() {
    setState(() {
      _controller.text =
          _controller.text.substring(0, _controller.text.length - 1);
    });
  }

  void addToBalance(String text, String type) async {
    // if (text.isNotEmpty && selectedValue != null) {
    if (_controller.text.isNotEmpty) {
      // print('Chosen input: $selectedValue');
      // int cardId = int.parse(selectedValue?.substring(0, 1) as String) - 1;
      // print('Get the first letter: $cardId');
      // print('Before Saldo: ${rejsekort}');
      var ref = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('cards')
          .where(
            'type',
            isEqualTo: type,
          )
          .get();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('cards')
          .doc(ref.docs[0]['id'])
          .update({
        'money': FieldValue.increment(
          int.parse(
            _controller.text,
          ),
        ),
      });
      // print('After Saldo: ${rejsekort.money}');
    } else {
      print('TEXT VALUE IS EMPTY!');
    }
  }

  // Use a TextEditingController to get the user's input
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CustomDropdownButton2(
          iconEnabledColor: Colors.blue.shade500,
          buttonDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue.shade500,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          icon: FaIcon(FontAwesomeIcons.arrowDown),
          buttonWidth: MediaQuery.of(context).size.width * 0.9,
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
        Expanded(
          flex: 1,
          child: Center(
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyTextInputFormatter(
                    locale: 'da', decimalDigits: 0, symbol: 'kr.'),
              ],
              enableInteractiveSelection: false,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.add,
                  color: Colors.transparent,
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.deleteLeft,
                          color: Colors.blue,
                        ),
                        onPressed: deleteText,
                      )
                    : null,
              ),
              readOnly: true,
              controller: _controller,
            ),
          ),
          // Text(
          //   text,
          //   style: TextStyle(
          //     fontSize: 40,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 2,
            child: NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.black,
              rightButtonFn: () {
                if (selectedValue != null) {
                  addToBalance(_controller.text, selectedValue!.toLowerCase());
                } else {
                  print('Select a card');
                }
              },
              rightIcon: Text(
                'Næste',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      // text = text + value;
      _controller.text += value;
    });
  }
}
