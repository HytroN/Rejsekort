import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rejsekort/models/cards/cards.dart';
import 'package:rejsekort/models/cards/generate_CardID.dart';
import '../widgets/numpad/numpad_widget.dart';

class NumPad extends StatefulWidget {
  // final List<TravelCard> cards;
  // NumPad(this.cards);
  @override
  _NumPadState createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  String text = '';

  void deleteText() {
    setState(() {
      text = text.substring(0, text.length - 1);
    });
  }

  final List<TravelCard> _travelCards = [
    Rejsekort(
      id: generateId(),
      money: 255.00,
    ),
    PendlerCard(
      id: generateId(),
    ),
    SchoolCard(
      id: generateId(),
    )
  ];

  List<String> getIdList() {
    return _travelCards
        .map((card) => '${_travelCards.indexOf(card) + 1}. ${card.type}')
        .toList();
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10),
          child: CustomDropdownButton2(
            iconEnabledColor: Colors.blue.shade500,
            buttonDecoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue.shade500,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            icon: FaIcon(FontAwesomeIcons.arrowDown),
            dropdownWidth: 340,
            buttonWidth: 340,
            hint: 'Vælg kort',
            dropdownItems: getIdList(),
            value: selectedValue,
            onChanged: (value) {
              setState(
                () {
                  selectedValue = value;
                },
              );
            },
          ),
        ),
        Container(
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: deleteText,
                icon: Icon(
                  Icons.backspace_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 2,
            child: NumericKeyboard(
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.black,
              rightButtonFn: () => print("Right button function"),
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
      text = text + value;
    });
  }
}
