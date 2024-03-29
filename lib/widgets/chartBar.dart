import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spending, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      return Column(
        children: [
          Container(height: constraints.maxHeight * 0.15, child: FittedBox(child: Text('₹${spending.toStringAsFixed(0)}'))),
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
              height: constraints.maxHeight * 0.6,
              width: 15,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                  FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child:Container(decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      )
                      )
                  )
                ],
              )
          ),
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(height : constraints.maxHeight * 0.15, child: FittedBox(child: Text('₹$label'))),
        ],
      );
    });
  }
}
