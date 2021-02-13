// import 'package:universal_html/html.dart';

import '../model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactionList.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset('assets/images/waiting.png'))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                              child:
                                  Text('\$${transactionList[index].amount}')),
                        ),
                      ),
                      title: Text(transactionList[index].title,
                          style: Theme.of(context).textTheme.headline6),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(transactionList[index].date)),
                    ),
                  );
                },
                itemCount: transactionList.length,
              ));
  }
}
