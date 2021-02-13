import './widget/chart.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'personal expense',
        theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          // fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: 't1', title: 'New Shoe', amount: 89.36, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New Book', amount: 100.35, date: DateTime.now()),
  ];
//get dynamically calculated the property
  List<Transaction> get _recenttransactionList {
    return _userTransaction.where((txt) {
      return txt.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      // date jodi onno date er poe hoi taile true return kore naile false
    }).toList();
    // last 7 din er transaction gula return korbe
  }

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
            Chart(_recenttransactionList),
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
