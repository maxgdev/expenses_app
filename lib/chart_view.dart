import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './single_bar.dart';
import './transaction.dart';

class ChartView extends StatelessWidget {
  final List<Transaction> weeksTransactions;

  ChartView(this.weeksTransactions);

  List<Map<String, Object>> get grpTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      // debug
      // print("weekDay: ${weekDay.day} month:: ${weekDay.month} ");
      // print("totalSum: $totalSum");

      for (var i = 0; i < weeksTransactions.length; i++) {
        if (weeksTransactions[i].date.day == weekDay.day &&
            weeksTransactions[i].date.month == weekDay.month &&
            weeksTransactions[i].date.year == weekDay.year) {
          totalSum += weeksTransactions[i].amount;
          // print(weekDay);
        }
      }
      return {
        // get first 2 letters of formatted Day of Week
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        // total for week
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return grpTransactionValues.fold(0.0, (sum, item) {
      var returnedTotal = sum + item['amount'];
      // print("total $returnedTotal");
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
          ),
        ),
      ),
    );
  }
}
