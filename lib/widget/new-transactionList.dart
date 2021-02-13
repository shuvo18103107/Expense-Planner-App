import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInput extends StatefulWidget {
  final Function addTrans;
  UserInput(this.addTrans);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final _titlecontroller = TextEditingController();

  final _amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enterTitle = _titlecontroller.text;
    final enterAmount = double.parse(_amountcontroller.text);
    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    // using widget we can acess widget class property inside the stat

    widget.addTrans(enterTitle, enterAmount);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    // showdate picker is future , futures are classes that allows to create object which gives us value in future
    showDatePicker(
            context: context,
            firstDate: DateTime(2020, 6),
            lastDate: DateTime.now(),
            initialDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titlecontroller,
              onSubmitted: (_) => _submitData(),

              // autofocus: true,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              // onChanged: (val) => amountInput = val,
              controller: _amountcontroller,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Choosen!'
                          : 'Picked Date:${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
                child: Text('Add Transcation'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData

                // print(titlecontroller.text);

                )
          ],
        ),
      ),
    );
  }
}
