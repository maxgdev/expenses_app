import 'package:flutter/material.dart';
import './transaction.dart';
import './transaction_list.dart';
import './add_transaction.dart';

class TransactionsView extends StatefulWidget {
  @override
  _TransactionsViewState createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  // Define some dummy data
  // List of Transactions
  final List<Transaction> _transactions = [
    Transaction(
        id: 't01', title: 'Office Shirt', amount: 19.99, date: DateTime.now()),
    Transaction(
        id: 't02', title: 'Trainers', amount: 49.99, date: DateTime.now()),
    // Transaction(
    //     id: 't03', title: 'Coffee mug', amount: 5.99, date: DateTime.now()),
    // Transaction(
    //     id: 't04', title: 'Lunch date', amount: 17.99, date: DateTime.now()),
    // Transaction(
    //     id: 't05',
    //     title: 'Supermarket shopping',
    //     amount: 27.54,
    //     date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
