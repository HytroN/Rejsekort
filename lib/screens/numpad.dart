import 'package:flutter/material.dart';
import '../widgets/numpad/numpad_widget.dart';

class NumPad extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  size: 25,
                  Icons.backspace_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
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
      ],
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }
}
