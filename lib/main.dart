import 'package:flutter/material.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/pages/cart_page.dart';
import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/login_page.dart';
import 'package:flutter_demo/uitls/routes.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    return MaterialApp(
      home: Homepage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      // routeInformationParser: VxInformationParser(),
      // routerDelegate: VxNavigator(routes: {
      //   "/": (_, __) => MaterialPage(child: loginPage()),
      //   MyRoutes.homeRoute: (_, __) => MaterialPage(child: Homepage()),
      // MyRoutes.homeDetailsRoute: (uri, params) {
      //   final catalog = (VxState.store as MyStore)
      //       .catalog
      //       .getById(int.parse(uri.queryParameters["id"]!));
      //   return MaterialPage(
      //       child: HomeDetailPage(
      //     catalog: catalog,
      //   ));
      // },
      //   MyRoutes.loginRoute: (_, __) => MaterialPage(child: loginPage()),
      //   MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
      // }),

      initialRoute: "/login",
      // initialRoute: MyRoutes.homeRoute,
      routes: {
        "/login": (context) => loginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => loginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
