import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rejsekort/models/cards/cards.dart';
import 'package:rejsekort/models/generate_ids.dart';
import '../widgets/numpad/numpad_widget.dart';

class NumPad extends StatefulWidget {
  final List<TravelCard> cards;
  NumPad(this.cards);
  @override
  _NumPadState createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  String? selectedValue;
  String text = '';

  void deleteText() {
    setState(() {
      text = text.substring(0, text.length - 1);
    });
  }

  void addToBalance(String text) {
    if (text.isNotEmpty || text == null) {
      print('Chosen input: $selectedValue');
      int cardId = int.parse(selectedValue?.substring(0, 1) as String);
      print('Get the first letter: $cardId');
      Rejsekort rejsekort = widget.cards[cardId] as Rejsekort;
      print('Before Saldo: ${rejsekort.money}');
      rejsekort.money += double.parse(text);
      print('After Saldo: ${rejsekort.money}');
    } else {
      print('TEXT IS EMPTY!');
    }
  }

  List<String> getIdList() {
    return widget.cards
        .where((card) => card.money != null)
        .map((card) =>
            '${widget.cards.indexOf(card) + 1} ${card.type} | ${card.id}')
        .toList();
  }

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
              rightButtonFn: () => addToBalance(text),
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
