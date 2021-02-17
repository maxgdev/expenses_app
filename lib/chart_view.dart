import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import './single_bar.dart';
import './transaction.dart';

class ChartView extends StatelessWidget {
  final List<Transaction> weeksTransactions;

  ChartView(this.weeksTransactions);

  List<Map<String, Object>> get grpTransactionValues {
    final List<Map<String, Object>> test = [];
    return test;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SingleBar('M', 5, 0.05),
              SingleBar('T', 25, 0.25),
              SingleBar('W', 10, 0.1),
              SingleBar('Th', 15, 0.15),
              SingleBar('F', 25, 0.25),
            ],
          ),
        ),
      ),
    );
  }
}
