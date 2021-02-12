import 'package:flutter/material.dart';
import './new-transactionList.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Shoe', amount: 89.36, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Book', amount: 100.35, date: DateTime.now()),
  ];
  void _addTransaction(String txtitle, double txamount) {
    final newtxt = Transaction(
        title: txtitle,
        amount: txamount,
        id: DateTime.now().toString(),
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newtxt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [UserInput(_addTransaction), TransactionList(_userTransaction)],
    );
  }
}
