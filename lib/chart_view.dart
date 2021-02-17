import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
import './single_bar.dart';
import './transaction.dart';

class ChartView extends StatelessWidget {
  final List<Transaction> weeksTransactions;

  ChartView(this.weeksTransactions);

  List<Map<String, Object>> get grpTransactionValues {
    // final List<Map<String, Object>> test = [];
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < weeksTransactions.length; i++) {
        if (weeksTransactions[i].date.day == weekDay.day &&
            weeksTransactions[i].date.month == weekDay.month &&
            weeksTransactions[i].date.year == weekDay.year) {
          totalSum += weeksTransactions[i].amount;
          print(weekDay);
        }
      }
      return {
        // get first letter of formatted Day of Week
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        // total for week
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return grpTransactionValues.fold(0.0, (sum, item) {
      var returnedTotal = sum + item['amount'];
      print(returnedTotal);
      return returnedTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: grpTransactionValues.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: SingleBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending,
                  ),
                );
              }).toList(),

              // [
              //   SingleBar('M', 5, 0.05),
              //   SingleBar('T', 25, 0.25),
              //   SingleBar('W', 10, 0.1),
              //   SingleBar('Th', 15, 0.15),
              //   SingleBar('F', 25, 0.25),
              // ],
              ),
        ),
      ),
    );
  }
}
