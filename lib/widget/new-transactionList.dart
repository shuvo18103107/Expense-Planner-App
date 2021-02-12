import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final Function addTrans;
  UserInput(this.addTrans);

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
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
              // onChanged: (val) => titleInput = val,
              controller: titlecontroller,

              // autofocus: true,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              // onChanged: (val) => amountInput = val,
              controller: amountcontroller,
            ),
            FlatButton(
              child: Text('Add Transcation'),
              textColor: Colors.purple,
              onPressed: () {
                addTrans(
                    titlecontroller.text, double.parse(amountcontroller.text));

                // print(titlecontroller.text);
                // print(amountcontroller.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
