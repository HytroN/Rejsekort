import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rejsekort/calc/zone_data.dart';

import '../../widgets/transition/transactions_seperator.dart';

class TransactionList extends StatelessWidget {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('transactions')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final transactions = snapshot.data!.docs;
        // snapshot.data.docs.i

        return transactions.isEmpty
            ? Center(
                child: Text('No transactions has been made'),
              )
            : Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: GroupedListView<dynamic, DateTime>(
                  physics: BouncingScrollPhysics(),
                  elements: transactions,
                  groupBy: (transactions) => DateUtils.dateOnly(
                    transactions['timestamp'].toDate(),
                  ),
                  groupSeparatorBuilder: (DateTime date) {
                    return TransactionsSeperator(
                      date: date,
                    );
                  },
                  order: GroupedListOrder.DESC,
                  itemBuilder: (context, dynamic transactions) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        print('${transactions.id}');
                        // Navigator.of(context).pushNamed('/transactions.id');
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade300,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: FaIcon(
                              transactions['isTransport']
                                  ? FontAwesomeIcons.train
                                  : FontAwesomeIcons.arrowsRotate,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                        title: Text(
                          transactions['isTransport']
                              ? '${ZONE_NAMES[transactions['fromStation']]} → ${ZONE_NAMES[transactions['toStation']]}'
                              : "Optankning af ${transactions['cardType'].toLowerCase()}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade900,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat.Hm().format(
                            transactions['timestamp'].toDate(),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        trailing: Text(
                          transactions['isTransport']
                              ? '-${transactions['price'].toStringAsFixed(2)} kr.'
                              : '${transactions['price'].toStringAsFixed(2)} kr.',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: transactions['isTransport']
                                ? Colors.red
                                : Colors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
