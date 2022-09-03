import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
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

    return Scaffold(
        backgroundColor: MyTheme.creamColor,

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
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
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

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: Vx.mOnly(right: 16),
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      )),
                  child: "Buy".text.make(),
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.roundedLg.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
