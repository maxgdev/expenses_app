import 'package:flutter/material.dart';

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

  void submitData() {
    final titleData = titleController.text;
    final amountData = double.parse(amountController.text);

    if (titleData.isEmpty || amountData <= 0) {
      return; // return if fields are empty
    }
    widget.addTransactionFn(titleData, amountData);
    Navigator.of(context).pop();
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
            FlatButton(
              child: Text("Add Transaction"),
              onPressed: submitData,
              // print(titleController.text);
              // print(amountController.text);
              // widget.addTransactionFn(
              //   titleController.text,
              //   double.parse(amountController.text)
              //   );
              // },
              textColor: Colors.blue,
            ),
            // () {} Anonymous function to enable onPress
          ],
        ),
      ),
    );
  }
}
