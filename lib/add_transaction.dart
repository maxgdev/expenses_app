import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  // Define function parameter
  final Function addTransactionFn;
  AddTransaction(this.addTransactionFn);
  // Input controllors
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              onPressed: () {
                // print(titleController.text);
                // print(amountController.text);
                addTransactionFn(titleController.text, double.parse(amountController.text));
              },
              textColor: Colors.blue,
            ),
            // () {} Anonymous function to enable onPress
          ],
        ),
      ),
    );
  }
}
