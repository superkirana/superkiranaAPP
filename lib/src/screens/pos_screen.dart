// POS Screen
import 'package:flutter/material.dart';

class POSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POS"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Product Catalog Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 9, // Example product count
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text("Item $index")),
                );
              },
            ),
          ),
          // Cart Summary and Checkout
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: \$100"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    // Handle checkout action.
                  },
                  child: Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
