import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../models/transactions/transactions.dart';
import '../../widgets/transition/transactions_seperator.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, DateTime>(
      elements: transactions,
      groupBy: (transactions) {
        return transactions.date;
      },
      groupSeparatorBuilder: (DateTime date) {
        return TransactionsSeperator(
          date: date,
        );
      },
      order: GroupedListOrder.DESC,
      itemBuilder: (context, dynamic transactions) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Container(
              width: 40,
              height: 40,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  color: transactions.category == "transport"
                      ? Colors.red
                      : Colors.blue,
                  transactions.category == "transport"
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                ),
              ),
            ),
          ),
          title: Text(
            transactions.category == "transport"
                ? '${transactions.fromStation} → ${transactions.toStation}'
                : "Optankning",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade900,
            ),
          ),
          subtitle: Text(
            DateFormat.Hm().format(transactions.date),
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
          trailing: Text(
            transactions.category == "transport"
                ? '-${transactions.amount.toStringAsFixed(2)} kr.'
                : '${transactions.amount.toStringAsFixed(2)} kr.',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: transactions.category == "transport"
                  ? Colors.red
                  : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
