import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInput extends StatefulWidget {
  final Function addTrans;
  UserInput(this.addTrans);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final _titlecontroller =
      TextEditingController(); // use kore kono input field er value store korte pari

  final _amountcontroller = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    // DateTime _selectedDate;

    final enterTitle =
        _titlecontroller.text; //.text diye value ki likhlo store korlam
    final enterAmount =
        double.parse(_amountcontroller.text); //jehutu double typer value chai
//validation code
    if (enterTitle.isEmpty ||
        enterAmount <= 0 ||
        _amountcontroller.text.isEmpty ||
        _selectedDate == null) {
      return; //mane eikhanei function execution off hoye jabe
    }
    // using widget we can acess widget class property inside the stat

    widget.addTrans(enterTitle, enterAmount, _selectedDate);
    // Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    // showdate picker is future , futures are classes that allows to create object which gives us value in future
    showDatePicker(
            // ekhane direct root context e jabe sekhane giye dekhbe kothai ei function er ref ace se jaigai show korbe jehutu root context sob position hold kore widget er
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
              onSubmitted: (_) =>
                  _submitData(), // anonymous function use korci tai argument e _ diya vujalam value paici but i dont care to use it
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    // expanded use korlam jate eita choose date er space bade baki sob space dokhol kore nei
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
