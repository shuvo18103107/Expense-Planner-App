import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: 't1', title: 'New Shoe', amount: 89.36, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Book', amount: 100.35, date: DateTime.now()),
  ];
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Expense Planner'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: Text(
                    'CHART!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        onChanged: (val) => titleInput = val,

                        // autofocus: true,
                      ),
                      TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                        ),
                        onChanged: (val) => amountInput = val,
                      ),
                      FlatButton(
                        child: Text('Add Transcation'),
                        textColor: Colors.purple,
                        onPressed: () {
                          print(titleInput);
                          print(amountInput);
                        },
                      )
                    ],
                  ),
                ),
              ),
              Column(
                  children: transaction.map((txt) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        '\$${txt.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          txt.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(txt.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList())
            ],
          ),
        ));
  }
}
