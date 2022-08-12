import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {

    final dummyList = List.generate(5, (index) =>  CatalogModel.Items[0]);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),

        title: Text("Catalog App"),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // itemCount: CatalogModel.Items.length,

          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              // item: CatalogModel.Items[index],
              item: dummyList[index],
            );
          },
        ),
      ),

      // Center(
      //   child: Container(
      //     child: Text("Welcome to $days days of flutter"),

      //     // child: Text(context.runtimeType.toString()),

      //   ),
      // ),

      // Container(
      //   height: 100,
      //   width: 100,
      //   color: Colors.red,
      // ),

      //  Container(
      //   constraints: BoxConstraints(
      //     minHeight: 70,
      //     maxHeight: 200,
      //     minWidth: 70,
      //     maxWidth: 200
      //   ),

      //   // height: 400,
      //   // width: 400,
      //   color: Colors.green,

      //   child: Container(
      //     // height: 10,
      //     // width: 10,
      //     color: Colors.red,
      //   ),
      // )

      drawer: MyDrawer(),
    );
  }
}
