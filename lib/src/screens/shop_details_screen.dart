// Shop Details Screen
import 'package:flutter/material.dart';

class ShopDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Details"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shop Name: My Shop", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Address: 123 Main Street", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Contact: 555-1234", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Business Hours: 9 AM - 9 PM", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
