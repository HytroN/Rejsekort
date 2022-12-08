import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale

class TransactionsSeperator extends StatelessWidget {
  final DateTime date;

  TransactionsSeperator({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
        child: Text(
          DateFormat.MMMMEEEEd('da_DK').format(date).toUpperCase(),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
