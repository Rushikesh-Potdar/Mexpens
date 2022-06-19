
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_expenses/widgets/chart.dart';
import 'package:m_expenses/widgets/new_transaction.dart';
import 'package:m_expenses/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  runApp(const MyApp());
}
//fdslgjlsjdlkfj

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.black54
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _startAddingNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction(_addNewTransaction);
    });
  }

  final List<Transaction> _userTransaction = [];

//  Transaction(id: 't1', title: 'New Watch', amount: 1600.00, date: DateTime.now()),
//  Transaction(id: 't2', title: 'Weekly Groceries', amount: 1000.0, date: DateTime.now()),

  List <Transaction> get _resentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date){
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date
    );

    setState(() {
      _userTransaction.add(newTx);
    });

  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }


  bool showChart = false;

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Expenses'),
      actions: [
        IconButton(
          onPressed:(){
            _startAddingNewTransaction(context);
          },
          icon: Icon(Icons.add,size: 30.0,),
        )
      ],
    );

    return Scaffold(
      //backgroundColor: const Color.fromRGBO(229, 241, 227, 0.9),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Show Chart'),
                Switch(value: showChart, onChanged: (val){
                  setState((){
                    showChart = val;
                  });
                }),
              ],
            ),
            if (!isLandscape) Container(
                height : (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.25 ,
                child: Chart(_resentTransaction)),
            if (!isLandscape)_userTransaction.isEmpty ? Icon(Icons.warning, size: 50.0,) : Container(
                height : (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.75,
                child: TransactionList(_userTransaction, _deleteTransaction)),
            //if (isLandscape)
            if (showChart) Container(
                height : (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.4 ,
                child: Chart(_resentTransaction)),
            if (isLandscape) _userTransaction.isEmpty ? Icon(Icons.warning, size: 50.0,) : Container(
                height : (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.6,
                child: TransactionList(_userTransaction, _deleteTransaction)
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddingNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
