import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transactionItem,
    @required this.deleteTx,
  }) : super(key: key);
  //beacuse i don't want the full list , i just want the transactionItem
  final Transaction
      transactionItem; //eikhane listtile banacii amar list er 1st index theke suru hobe data nibo list er value gula like id amount title eigula s
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(child: Text('\$${transactionItem.amount}')),
          ),
        ),
        title: Text(transactionItem.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat.yMMMd().format(transactionItem.date)),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            // jokhn kono onpress e direct execution hoi mane kono argument expect kore na oi function tokhn direct pointer kore dilei hoi oi function er r na hole ()=> pointervalue(expected argument)
            onPressed: () => deleteTx(transactionItem.id)),
      ),
    );
  }
}
