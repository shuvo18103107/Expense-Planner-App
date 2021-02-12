import 'package:flutter/material.dart';
import './widget/userTransiction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // String titleInput;
  // String amountInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
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
                UserTransaction()
              ],
            ),
          ),
        ));
  }
}
