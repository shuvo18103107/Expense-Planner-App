import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get _grouptransactionvalue {
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
    }).reversed.toList();
  }

  // total amount in last 7 days
  double get _totalSpendInweek {
    // 1st argument starting value r 2nd e collection ba map er ekta value dore 1t argument e add korte thakbo ete collection reduce hoye ekta singel value dibe
    return _grouptransactionvalue.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_grouptransactionvalue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _grouptransactionvalue.map((data) {
            // per map er jonno ekta chart draw kori row te r sei tar value pass korci
            // / operator use korle ki typer value pass kori indicate kore dite hbe i mean type of object
            // flexible use kori ekta roww ba column ba flex er vitorer child gula kototuk space nibe , flexfit.tight diye vujalam ndynamically bar gula create jehutu hocee tai available space er vitore fitted thakte hobe
            return Flexible(
              fit: FlexFit.tight,
              child: Barchart(
                  data['day'],
                  data['amount'],
                  //  ekhn data server e nai tai app restart korle sob data loss hoia jai tai kono transiction thake na tai chart e totalspending  0 thakar karone 0/0  pass korar karone app crush khai tai logic dite hobe
                  _totalSpendInweek == 0.0
                      ? 0.0
                      : (data['amount'] as double) / _totalSpendInweek),
            );
          }).toList(),
        ),
      ),
    );
  }
}
