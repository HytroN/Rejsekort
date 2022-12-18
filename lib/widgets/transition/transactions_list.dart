import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/transactions/transactions.dart';

import '../../widgets/transition/transactions_seperator.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GroupedListView<dynamic, DateTime>(
        physics: BouncingScrollPhysics(),
        elements: transactions,
        groupBy: (transactions) => DateUtils.dateOnly(transactions.date),
        groupSeparatorBuilder: (DateTime date) {
          return TransactionsSeperator(
            date: date,
          );
        },
        order: GroupedListOrder.DESC,
        itemBuilder: (context, dynamic transactions) {
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => print('${transactions.id}'),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade300,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: FaIcon(
                    transactions.isTransport
                        ? FontAwesomeIcons.train
                        : FontAwesomeIcons.arrowsRotate,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              title: Text(
                transactions.isTransport
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
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
              trailing: Text(
                transactions.isTransport
                    ? '-${transactions.amount.toStringAsFixed(2)} kr.'
                    : '${transactions.amount.toStringAsFixed(2)} kr.',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: transactions.isTransport ? Colors.red : Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
