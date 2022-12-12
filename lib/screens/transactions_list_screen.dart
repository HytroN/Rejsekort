import 'package:flutter/material.dart';

import '../../models/dummy_data.dart';
import '../../widgets/transition/transactions_list.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TransactionList(USER_TRANSACTIONS);
  }
}
