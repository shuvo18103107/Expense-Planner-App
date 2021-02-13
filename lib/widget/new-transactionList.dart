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
    // using widget we can acess widget class property inside the stat

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
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    'No Date Choosen!',
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text('Add Transcation'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitData

                // print(titlecontroller.text);

                )
          ],
        ),
      ),
    );
  }
}
