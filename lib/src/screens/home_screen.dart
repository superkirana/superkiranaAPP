// 3. Home Screen with Bottom Navigation and Side Drawer
import 'package:flutter/material.dart';
import 'package:superkirana/src/screens/inventory_screen.dart';
import 'package:superkirana/src/screens/invoice_screen.dart';
import 'package:superkirana/src/screens/pos_screen.dart';
import 'package:superkirana/src/widgets/side_drawer.dart' as widgets;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Index for bottom navigation bar
  int _selectedIndex = 0;

  // List of widgets for bottom navigation items.
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    POSScreen(),
     InvoiceScreen(),
     MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar automatically shows the hamburger icon if a drawer is provided.
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ShopName", style: TextStyle(fontSize: 18)),
            Text("24 Aug 2024", style: TextStyle(fontSize: 12)),
          ],
        ),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications or mini-cart action here.
            },
          ),
        ],
      ),
      drawer: widgets.SideDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: "POS"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Invoice"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
