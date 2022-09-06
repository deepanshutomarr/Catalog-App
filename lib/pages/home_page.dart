import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/models/cart.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/uitls/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "Codepur";

  // final url = "https://api.jsonbin.io/b/604ddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");



    //For http use
    // final response = await http.get(Uri.parse(url));


    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(5, (index) => CatalogModel.Items[0]);

    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.red500,
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),

        // appBar: AppBar(
        //   // backgroundColor: Colors.white,
        //   // elevation: 0.0,
        //   // iconTheme: IconThemeData(color: Colors.black),

        //   title: Text("Catalog App"),
        // ),

        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Center(
                    child: CircularProgressIndicator().centered().expand(),
                  )
              ],
            ),
          ),
        )

        // Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //         ? GridView.builder(
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 16,
        //               crossAxisSpacing: 16,
        //             ),
        //             itemBuilder: (context, index) {
        //               final item = CatalogModel.items[index];
        //               return Card(
        //                   clipBehavior: Clip.antiAlias,
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10)),
        //                   child: GridTile(
        //                     header: Container(
        //                       child: Text(
        //                         item.name,
        //                         style: TextStyle(color: Colors.white),
        //                       ),
        //                       padding: const EdgeInsets.all(12),
        //                       decoration: BoxDecoration(
        //                         color: Colors.deepPurple,
        //                       ),
        //                     ),
        //                     child: Image.network(
        //                       item.image,
        //                     ),
        //                     footer: Container(
        //                       child: Text(
        //                         // item.name,
        //                         item.price.toString(),
        //                         style: TextStyle(color: Colors.white),
        //                       ),
        //                       padding: const EdgeInsets.all(12),
        //                       decoration: BoxDecoration(
        //                         color: Colors.black,
        //                       ),
        //                     ),

        //                   ));
        //             },
        //             itemCount: CatalogModel.items.length,
        //           )
        //         // ListView.builder(
        //         //     itemCount: CatalogModel.items.length,

        //         //     // itemCount: dummyList.length,
        //         //     itemBuilder: (context, index) {
        //         //       return ItemWidget(
        //         //         item: CatalogModel.items[index],
        //         //         // item: dummyList[index],
        //         //       );
        //         //     },
        //         // )
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           ),
        //   ),

        //   // Center(
        //   //   child: Container(
        //   //     child: Text("Welcome to $days days of flutter"),

        //   //     // child: Text(context.runtimeType.toString()),

        //   //   ),
        //   // ),

        //   // Container(
        //   //   height: 100,
        //   //   width: 100,
        //   //   color: Colors.red,
        //   // ),

        //   //  Container(
        //   //   constraints: BoxConstraints(
        //   //     minHeight: 70,
        //   //     maxHeight: 200,
        //   //     minWidth: 70,
        //   //     maxWidth: 200
        //   //   ),

        //   //   // height: 400,
        //   //   // width: 400,
        //   //   color: Colors.green,

        //   //   child: Container(
        //   //     // height: 10,
        //   //     // width: 10,
        //   //     color: Colors.red,
        //   //   ),
        //   // )

        //   drawer: MyDrawer(),

        );
  }
}
