import 'package:flutter/material.dart';
import 'package:superkirana/src/screens/invoice_screen.dart';
import 'package:superkirana/src/screens/issue_screen.dart';
import 'package:superkirana/src/screens/pos_screen.dart';
import 'package:superkirana/src/screens/report_screen.dart';
import 'package:superkirana/src/screens/shop_details_screen.dart';
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
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/inventory': (context) => InventoryScreen(),
        '/stock': (context) => StockScreen(),
        '/pos': (context) => POSScreen(),
        '/report': (context) => ReportScreen(),
        '/issue': (context) => IssueScreen(),
        '/shopDetails': (context) => ShopDetailsScreen(),
        '/invoice': (context) => InvoiceScreen(),
        '/menu': (context) => MenuScreen(),
      },
    );
  }
}

// 1. Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some initialization work.
    Future.delayed(Duration(seconds: 3), () {
      // After splash, navigate to Login (or Home if no auth is required)
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ShopPOS',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Login / Sign Up Screen
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email/Phone",
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    // After sign in, navigate to Home Screen.
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    child: Text("Sign In", style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: Text("Forgot Password?")),
                    TextButton(onPressed: () {}, child: Text("Create an Account"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 3. Home Screen with Bottom Navigation and Side Drawer
class HomeScreen extends StatefulWidget {
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
      drawer: SideDrawer(),
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

// Dashboard Screen (Home Content with Banner & Feature Grid)
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

// Side Drawer for Navigation
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

// 4. Main Feature Screens

// Inventory Screen
class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: 10, // Example product count
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.inventory),
            title: Text("Product $index"),
            subtitle: Text("SKU: 12345, Quantity: ${index * 10}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add new inventory item.
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}



// Menu Screen (Placeholder for bottom navigation)
class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text("Menu Screen Content"),
      ),
    );
  }
}
