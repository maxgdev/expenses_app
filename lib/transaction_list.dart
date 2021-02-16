import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  // SingleChildScrollView
  
  @override
  Widget build(BuildContext context) {
    return Column(
        // iterate over transactions variable
        children: transactions.map((transaction) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[50], width: 2)),
              padding: EdgeInsets.all(10),
              child: Text(
                "${transaction.amount.toStringAsFixed(2)}",  // Ensure amount has 2 decimal places
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMd().format(transaction.date),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ));
    }).toList() // Convert transactions to iterable List

        );
  }
}
