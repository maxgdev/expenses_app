import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  // Define function parameter
  final Function addTransactionFn;
  AddTransaction(this.addTransactionFn);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;
  void submitData() {
    // check amount is NOT empty before assignment
    if (amountController.text.isEmpty) {
      return;
    }
    final titleData = titleController.text;
    final amountData = double.parse(amountController.text);

    if (titleData.isEmpty || amountData <= 0 || selectedDate == null) {
      return; // return if fields are empty
    }
    widget.addTransactionFn(titleData, amountData, selectedDate);
    Navigator.of(context).pop();
  }

  void openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            Row(
              children: [
                Text(selectedDate == null
                    ? "Enter Date: "
                    : DateFormat.yMd().format(selectedDate)),
                FlatButton(
                    onPressed: openDatePicker, child: Text("Choose Date")),
              ],
            ),
            RaisedButton(
              child: Text("Add Transaction"),
              onPressed: submitData,
              textColor: Colors.white,
              color: Theme.of(context).accentColor,
            ),
            // () {} Anonymous function to enable onPress
          ],
        ),
      ),
    );
  }
}
