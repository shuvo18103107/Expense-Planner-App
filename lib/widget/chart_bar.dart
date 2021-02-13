import 'package:flutter/material.dart';

class Barchart extends StatelessWidget {
  final String weekday;
  final double spendingAmount;
  final double spendingPcOfTotal;

  Barchart(this.weekday, this.spendingAmount, this.spendingPcOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // fittedbox tar child ke available space er vitor fit kore rakhe
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              // bottom widget
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              // now rest of the portion need blank so we use fractionallysizedbox widget
              FractionallySizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                heightFactor: spendingPcOfTotal,
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(weekday),
      ],
    );
  }
}
