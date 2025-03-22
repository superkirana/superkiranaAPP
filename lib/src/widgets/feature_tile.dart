import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String routeName;

  const FeatureTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 30, color: Colors.orange),
              SizedBox(height: 8),
              Text(label, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

