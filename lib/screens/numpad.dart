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
  // String? selectedValue;

  void deleteText() {
    setState(() {
      _controller.text =
          _controller.text.substring(0, _controller.text.length - 1);
    });
  }

  void addToBalance(String text) {
    // if (text.isNotEmpty && selectedValue != null) {
    if (_controller.text.isNotEmpty) {
      // print('Chosen input: $selectedValue');
      // int cardId = int.parse(selectedValue?.substring(0, 1) as String) - 1;
      // print('Get the first letter: $cardId');
      TravelCard rejsekort = widget.cards[0];
      print('Before Saldo: ${rejsekort}');
      _controller.text = _controller.text.replaceAll(',', '.');
      rejsekort.money += double.parse(_controller.text);
      print('After Saldo: ${rejsekort.money}');
    } else {
      print('TEXT VALUE IS EMPTY!');
    }
  }

  List<String> getIdList() {
    return widget.cards
        .where((card) => card.money != null)
        .map((card) => card.id)
        .toList();
  }

  // Use a regular expression to check for multiple decimal points
  final RegExp _regex = RegExp(r'^\d*\.?\d*\.\d*$');

  // Use a TextEditingController to get the user's input
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.only(top: 10),
        //   child: CustomDropdownButton2(
        //     iconEnabledColor: Colors.blue.shade500,
        //     buttonDecoration: BoxDecoration(
        //       border: Border.all(
        //         color: Colors.blue.shade500,
        //       ),
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     icon: FaIcon(FontAwesomeIcons.arrowDown),
        //     dropdownWidth: 340,
        //     buttonWidth: 340,
        //     hint: 'Vælg kort',
        //     dropdownItems: getIdList(),
        //     value: selectedValue,
        //     onChanged: (value) {
        //       setState(
        //         () {
        //           selectedValue = value;
        //         },
        //       );
        //     },
        //   ),
        // ),
        Expanded(
          flex: 1,
          child: Center(
            child: TextField(
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
                        ),
                        onPressed: deleteText,
                      )
                    : null,
              ),
              readOnly: true,
              controller: _controller,
              onChanged: (value) {
                if (_regex.hasMatch(value)) {
                  // If the input contains multiple decimal points, show an error message
                  print('object');
                }
              },
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
              rightButtonFn: () => addToBalance(_controller.text),
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
