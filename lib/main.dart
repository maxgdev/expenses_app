import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the Debug banner
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Define some dummy data
  // List of Transactions
  final List<Transaction> transactions = [
    Transaction(
        id: 't01', title: 'Office Shirt', amount: 19.99, date: DateTime.now()),
    Transaction(
        id: 't02', title: 'Trainers', amount: 49.99, date: DateTime.now()),
    Transaction(
        id: 't03', title: 'Coffee mug', amount: 5.99, date: DateTime.now()),
    Transaction(
        id: 't04',
        title: 'Supermarket shopping',
        amount: 27.54,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Column(
          // iterate over transactions variable
          children: transactions.map((transaction) {
        return Card(
          child: Row(
            children: [
              Text("${transaction.amount}"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(transaction.title),
                Text("${transaction.date}"),
              ],)
            ],
          )
        );
      }).toList() // Convert transactions to iterable List

          ),
    );
  }
}
