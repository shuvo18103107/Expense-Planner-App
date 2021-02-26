import '../model/transaction.dart';
import 'package:flutter/material.dart';
import './transactionitem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteTransactionList;
  TransactionList(this.transactionList, this.deleteTransactionList);

  @override
  Widget build(BuildContext context) {
    print(transactionList);
    return Container(
        height: 450,
        child: transactionList.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 315,
                      child: Image.asset('assets/images/waiting.png'))
                ],
              )
            : ListView(
                children: transactionList
                    .map((data) => TransactionItem(
                          key: ValueKey(data.id),
                          transactionItem: data,
                          deleteTx: deleteTransactionList,
                        ))
                    .toList()));
  }
}
