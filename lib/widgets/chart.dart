import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:m_expenses/widgets/chartBar.dart';

class Chart extends StatelessWidget {

  Chart(this.resentTransaction);

  final List<Transaction> resentTransaction;

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index) {
      var weekDays = DateTime.now().subtract(Duration(days: index));
      double sumOfTransaction = 0;
      for(var i = 0; i < resentTransaction.length; i++){
        if(resentTransaction[i].date.day == weekDays.day &&
          resentTransaction[i].date.month == weekDays.month &&
          resentTransaction[i].date.year == weekDays.year
        ){
          sumOfTransaction += resentTransaction[i].amount;
        }
      }
      return {
        'day':DateFormat.E().format(weekDays).substring(0, 1),
        'amount':sumOfTransaction
      };
    }).reversed.toList();
  }

  double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum, item){
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groupedTransactionValues);
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'] as String,
                  data['amount'] as double,
                  totalSpending == 0.0 ? 0.0 : (data['amount'] as double)/totalSpending
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
