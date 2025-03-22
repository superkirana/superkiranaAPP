import 'package:flutter/material.dart';
import 'package:superkirana/src/screens/customer_cart_screen.dart';
import 'package:superkirana/src/screens/home_screen.dart' as home;
import 'package:superkirana/src/screens/inventory_screen.dart' as inventory;
import 'package:superkirana/src/screens/invoice_screen.dart';
import 'package:superkirana/src/screens/issue_screen.dart';
import 'package:superkirana/src/screens/login_screen.dart' as login;
import 'package:superkirana/src/screens/pos_screen.dart';
import 'package:superkirana/src/screens/report_screen.dart';
import 'package:superkirana/src/screens/shop_details_screen.dart';
import 'package:superkirana/src/screens/splash_screen.dart' as splash;
import 'package:superkirana/src/screens/stock_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // The root widget for the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopPOS',
      theme: ThemeData(
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => splash.SplashScreen(),
        '/login': (context) => login.LoginScreen(),
        '/home': (context) => home.HomeScreen(),
        '/inventory': (context) => inventory.InventoryScreen(),
        '/stock': (context) => StockScreen(),
        '/pos': (context) => POSScreen(),
        '/report': (context) => ReportScreen(),
        '/issue': (context) => IssueScreen(),
        '/shopDetails': (context) => ShopDetailsScreen(),
        '/invoice': (context) => InvoiceScreen(),
        '/menu': (context) => inventory.MenuScreen(),
        '/customerCart': (context) => CustomerCartScreen(),
      },
    );
  }
}
