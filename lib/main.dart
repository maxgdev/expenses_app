import 'package:flutter/material.dart';
import './transactions_view.dart';

void main() {
  runApp(MyApp());
}

void openModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      print("Opened Modal pop-up");
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(18.0),
        child: Text("Modal Pop-up"),
      );
    },
  );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenses App'), actions: [
        IconButton(
            icon: Icon(Icons.add),color: Colors.red, onPressed: () => openModal(context))
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
            TransactionsView(),
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
