import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
import './transaction_list.dart';
import './add_transaction.dart';
import './chart_view.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define some dummy List of Transactions
  final List<Transaction> _transactions = [
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
    
  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  // Open Bottom Modal widget
  void openModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AddTransaction(_addNewTransaction));
      },
    );
  }

  void deleteTransaction(String transId) {
    setState(() {
      _transactions.removeWhere((element) => element.id == transId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenses App'), actions: [
        IconButton(icon: Icon(Icons.add), onPressed: () => openModal(context))
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChartView(_recentTransactions),
            TransactionList(_transactions, deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openModal(context),
      ),
    );
  }
}
