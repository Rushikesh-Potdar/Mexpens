// /* child: ListView.builder(
// itemBuilder: (ctx, index){
// return Card(
// elevation: 12,
// child: Row(
// children: [
// Container(
// padding: const EdgeInsets.all(8.0),
// margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
// child: Center(child: Text('₹${(_userTransaction[index].amount).toStringAsFixed(2)}', style: TextStyle(color: Theme.of(context).primaryColorDark, fontWeight: FontWeight.w900, fontSize: 20),)),
// decoration: BoxDecoration(
// //borderRadius: BorderRadius.all(Radius.circular(45)),
// color: Colors.white,
// border: Border.all(color: Theme.of(context).primaryColorLight, width: 2)
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(_userTransaction[index].title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1),),
// Text(DateFormat.yMMMd().format(_userTransaction[index].date), style: const TextStyle(color: Colors.grey, fontSize: 14,))
// ],
// ),
// ],
// ),
// );
// }