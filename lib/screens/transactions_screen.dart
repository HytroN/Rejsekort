import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../../widgets/transition/transactions_list.dart';

class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransactionList(USER_TRANSACTIONS);
  }
}
