
// Stock Screen
import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text("Stock Screen Content"),
      ),
    );
  }
}