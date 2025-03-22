// Dashboard Screen (Home Content with Banner & Feature Grid)
import 'package:flutter/material.dart';
import 'package:superkirana/src/widgets/feature_tile.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner / Hero Image
          Container(
            margin: EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/350x150"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Feature Grid with six tiles
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                FeatureTile(icon: Icons.inventory, label: "Inventory", routeName: "/inventory"),
                FeatureTile(icon: Icons.store, label: "Stock", routeName: "/stock"),
                FeatureTile(icon: Icons.point_of_sale, label: "POS", routeName: "/pos"),
                FeatureTile(icon: Icons.bar_chart, label: "Report", routeName: "/report"),
                FeatureTile(icon: Icons.error_outline, label: "Issue", routeName: "/issue"),
                FeatureTile(icon: Icons.shop, label: "Shop Details", routeName: "/shopDetails"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


