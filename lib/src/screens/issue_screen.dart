// Issue Screen
import 'package:flutter/material.dart';

class IssueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Issue Tracking"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: 5, // Example issues count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Issue $index"),
            subtitle: Text("Details of issue $index"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to create a new issue.
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}

