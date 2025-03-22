// Side Drawer for Navigation
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Hello, shapepos"),
            accountEmail: Text("shop@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("S", style: TextStyle(fontSize: 24, color: Colors.orange)),
            ),
            decoration: BoxDecoration(color: Colors.orange),
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text("All Sales"),
            onTap: () {
              // Navigate to All Sales screen.
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text("New Sale"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text("Add Product"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text("Statistics"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("Customers"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.currency_exchange),
            title: Text("Exchange Rate"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text("Categories"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text("Support"),
            onTap: () {},
          ),
          Spacer(),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("App Version 1.0.0", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
