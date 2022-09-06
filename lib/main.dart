import 'package:flutter/material.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/pages/cart_page.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/login_page.dart';
import 'package:flutter_demo/uitls/routes.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Homepage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),

      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,

      // initialRoute: "/",
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => loginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => loginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
