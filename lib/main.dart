import 'package:flutter/material.dart';
import './transaction.dart';
import './transaction_list.dart';
import './add_transaction.dart';

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
    // Transaction(
    //     id: 't01', title: 'Office Shirt', amount: 19.99, date: DateTime.now()),
    // Transaction(
    //     id: 't02', title: 'Trainers', amount: 49.99, date: DateTime.now()),
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

  // Open Bottom Modal widget
  void openModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        print("Opened Modal pop-up");
        return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AddTransaction(_addNewTransaction));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenses App'), actions: [
        IconButton(icon: Icon(Icons.add), onPressed: () => openModal(context))
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: Image.network(
                  "https://via.placeholder.com/800x280.png/?text=Chart+Area"),
            ),
            // AddTransaction(_addNewTransaction),
            TransactionList(_transactions),
            // TransactionsView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openModal(context),
        // onPressed: () => {},
      ),
    );
  }
}
