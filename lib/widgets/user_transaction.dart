// import 'package:flutter/material.dart';

// import './new_transaction.dart';
// import './transaction_list.dart';
// import '..models/transaction.dart';

// class UserTransactions extends StatefulWidget {
//   // final List<Transaction> _userTransactions = [
//   //   Transaction(
//   //     id: 't1',
//   //     title: 'New Shoes',
//   //     amount: 69.69,
//   //     date: DateTime.now(),
//   //   ),
//   //   Transaction(
//   //     id: 't2',
//   //     title: 'Weekly Groceries',
//   //     amount: 16.53,
//   //     date: DateTime.now(),
//   //   ),
//   // ];

//   // void _addNewTransaction(String txTitle, double txAmount) {
//   //   final newTx = Transaction(
//   //     title: txTitle,
//   //     amount: txAmount,
//   //     dateL DateTime.now(),
//   //     id: DateTime.now().toString(),
//   //   );

//   //   setState(() {
//   //     _userTransactions.add(newTx);
//   //   });

//   // }

//   @override
//   State<UserTransactions> createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         NewTransactionList(_addNewUserTransaction),
//         TransactionList(_UserTransactions),
//       ],
//     );
//   }
// }
