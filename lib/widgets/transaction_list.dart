import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m_expenses/models/transaction.dart';


class TransactionList extends StatelessWidget {
  final Function _deleteTx;
  TransactionList(this._userTransaction, this._deleteTx, {Key? key}) : super(key: key);

  final List<Transaction> _userTransaction;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index){
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(child: Text('₹${(_userTransaction[index].amount).toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleLarge,)),
              ),
              radius: 30,
              backgroundColor: Colors.amber,
              foregroundColor:  Colors.black54,
            ),
            title: Text(_userTransaction[index].title, style: Theme.of(context).textTheme.titleLarge,),
            subtitle: Text(DateFormat.yMMMEd().format(_userTransaction[index].date)),
            trailing: IconButton(onPressed: (){_deleteTx(_userTransaction[index].id);}, icon: const Icon(Icons.delete, color: Colors.red,)),
          ),
        );
      },
      itemCount: _userTransaction.length,
    );
  }
}
