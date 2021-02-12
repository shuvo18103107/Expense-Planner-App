import './widget/transaction_list.dart';
import './widget/new-transactionList.dart';
import 'package:flutter/material.dart';
import './model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'personal expense',
        theme:
            ThemeData(primarySwatch: Colors.purple, accentColor: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      print('new item added');
    });
  }

  void _addnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return UserInput(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addnewTransaction(context))
        ],
        title: Text('Expense Planner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
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
            TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => _addnewTransaction(context)),
    );
  }
}
