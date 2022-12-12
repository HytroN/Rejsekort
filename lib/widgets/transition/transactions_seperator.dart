import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale

class TransactionsSeperator extends StatefulWidget {
  final DateTime date;

  TransactionsSeperator({required this.date});

  @override
  State<TransactionsSeperator> createState() => _TransactionsSeperatorState();
}

class _TransactionsSeperatorState extends State<TransactionsSeperator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Initialize the locale
    initializeDateFormatting('da_DK');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
        child: Text(
          DateFormat.MMMMEEEEd('da_DK').format(widget.date).toUpperCase(),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
