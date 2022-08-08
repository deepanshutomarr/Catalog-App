// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../models/transaction.dart';

// class TransactionList extends StatelessWidget {
//   TransactionList(List<Transaction> userTransactions);


// class _TransactionListState extends State<TransactionList> {
//   final List<Transaction> transactions;

//   TransactionList(this.transactions);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container (
//       height: 300,
//         child: ListView.builder(
//           itemBuider: (ctx, index) {
//             return Card(
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 15,
//                   ),
//                   decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 2,
//                   ),
//                 ),
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                     // tx.amount.toString(),
//                     '\$${transactions[index].amount.toStringFixed(2)}',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold, 
//                       fontSize: 20,
//                       color: Colors.purple,
//                     )),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     transactions[index].title,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     // tx.date.toString()
//                     Dateformat.yyMMMd().format(tx.date),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       }
//           },
//           itemCount: transactions.length,

//           children: _userTransaction.map((tx) {
//             ).toList(),
//     ));
//   }
// }
