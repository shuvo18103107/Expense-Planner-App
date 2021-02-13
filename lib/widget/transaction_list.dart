// import 'package:universal_html/html.dart';

import '../model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteTransactionList;
  TransactionList(this.transactionList, this.deleteTransactionList);

  @override
  Widget build(BuildContext context) {
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
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          // jokhn kono onpress e direct execution hoi mane kono argument expect kore na oi function tokhn direct pointer kore dilei hoi oi function er r na hole ()=> pointervalue(expected argument)
                          onPressed: () =>
                              deleteTransactionList(transactionList[index].id)),
                    ),
                  );
                },
                itemCount: transactionList.length,
              ));
  }
}
