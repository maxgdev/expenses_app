import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        id: 't04', title: 'Lunch date', amount: 17.99, date: DateTime.now()),
    Transaction(
        id: 't05',
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
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Image.network(
                "https://via.placeholder.com/800x280.png/?text=Chart+Area"),
          ),
          Card(
            elevation: 5,
            child: Container(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(decoration: InputDecoration(labelText: 'Amount')),
                  FlatButton(
                    child: Text("Add Transaction"), 
                    onPressed: () {},
                    textColor: Colors.blue,
                    ),
                  // () {} Anonymous function to enable onPress
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
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
                        "${transaction.amount}",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

                ),
          ),
        ],
      ),
    );
  }
}
