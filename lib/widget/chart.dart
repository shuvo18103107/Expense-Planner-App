import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get grouptransactionvalue {
    return List.generate(7, (index) {
      // last 7 days dekhabe currebt date theke suru kore
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalamount = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalamount = totalamount + recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalamount);
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalamount
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(grouptransactionvalue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: grouptransactionvalue.map((data) {
          return Text('${data['day']}:${data['amount']}');
        }).toList(),
      ),
    );
  }
}
