import 'dart:math';

import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
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
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgcolor;
  @override
  void initState() {
    const availablecolor = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple
    ];
    _bgcolor = availablecolor[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgcolor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(child: Text('\$${widget.transactionItem.amount}')),
          ),
        ),
        title: Text(widget.transactionItem.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat.yMMMd().format(widget.transactionItem.date)),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            // jokhn kono onpress e direct execution hoi mane kono argument expect kore na oi function tokhn direct pointer kore dilei hoi oi function er r na hole ()=> pointervalue(expected argument)
            onPressed: () => widget.deleteTx(widget.transactionItem.id)),
      ),
    );
  }
}
