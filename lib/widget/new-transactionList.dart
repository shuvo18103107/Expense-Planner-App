import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final Function addTrans;
  UserInput(this.addTrans);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitData() {
    final enterTitle = titlecontroller.text;
    final enterAmount = double.parse(amountcontroller.text);
    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }

    widget.addTrans(enterTitle, enterAmount);
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),

              // autofocus: true,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              // onChanged: (val) => amountInput = val,
              controller: amountcontroller,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                child: Text('Add Transcation'),
                textColor: Colors.purple,
                onPressed: submitData

                // print(titlecontroller.text);

                )
          ],
        ),
      ),
    );
  }
}
