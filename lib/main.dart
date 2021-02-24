import 'package:flutter/rendering.dart';
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
          // textthemeuse kori pura app er overall text gular ekta theming dite
          textTheme: ThemeData.light().textTheme.copyWith(
              // default theme er upor override korbe ei theme
              //r theming use kore holo : Theme.of(context).textTheme.headline6
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              button: TextStyle(color: Colors.white)),
          // buttonColor: Colors.purple,
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          errorColor: Colors.red,
          // fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              // etar mane default theme er upor override kore ei change gula anbe
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
  // list er vitore object initialize korlam Transaction object jar value class theke astece
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
      //current date dore 7 din piconer date gula nibe same date e jotogulai hok just date gula niya pathabe 7 ta item e je list e thakbe emn na
      // date jodi onno date er poe hoi taile true return kore naile false
    }).toList(); //iterable list hiseve jate thake tai tolist
    // last 7 din er transaction gula return korbe
  }

  void _addTransaction(String txtitle, double txamount, DateTime choosenDate) {
    final newtxt = Transaction(
        title: txtitle,
        amount: txamount,
        id: DateTime.now().toString(),
        date: choosenDate);

    setState(() {
      _userTransaction.add(newtxt);
      print('new item added');
    });
  }

  void _addnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx, //kon position e eta call hoice
        builder: (_) {
          return UserInput(_addTransaction);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((doc) => doc.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  _addnewTransaction(context)) //positioning er jonno context
        ],
        title: Text('Expense Planner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recenttransactionList),
            TransactionList(_userTransaction, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          //accentcolor er jonno pabe na
          // hoverColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () => _addnewTransaction(
              context)), //amar buildcontext er context value diye position pass korlam annoymous function diye
      //jehutu modal show korabo tai function er perameter e data pass na kore kon position e show korabo setar position diye dilam context value diye // r annoymous function chara use korle just ref dilei hoi
    );
  }
}
