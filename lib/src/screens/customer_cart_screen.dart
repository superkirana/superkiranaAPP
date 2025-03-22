import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CustomerCartScreen extends StatefulWidget {
  const CustomerCartScreen({Key? key}) : super(key: key);

  @override
  _CustomerCartScreenState createState() => _CustomerCartScreenState();
}

class _CustomerCartScreenState extends State<CustomerCartScreen> {
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerMobileController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQuantityController = TextEditingController();

  // In a production app, you would get a valid token after login.
  late ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(token: "JWT_TOKEN");
  }

  // Call API to add a customer.
  void _addCustomer() async {
    try {
      final response = await apiService.addCustomer(
        name: _customerNameController.text,
        mobile: _customerMobileController.text.isNotEmpty ? _customerMobileController.text : null,
      );
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response["message"] ?? "Customer added")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  // Call API to add an item to the cart.
  void _addToCart(String customerId) async {
    try {
      final productName = _productNameController.text;
      final price = double.tryParse(_productPriceController.text) ?? 0.0;
      final quantity = int.tryParse(_productQuantityController.text) ?? 1;
      final response = await apiService.addToCart(customerId, [
        {"productName": productName, "price": price, "quantity": quantity}
      ]);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response["message"] ?? "Cart updated")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Customer & Cart"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Customer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
              controller: _customerNameController,
              decoration: InputDecoration(labelText: "Customer Name"),
            ),
            TextField(
              controller: _customerMobileController,
              decoration: InputDecoration(labelText: "Mobile Number (optional)"),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _addCustomer,
              child: Text("Add Customer"),
            ),
            Divider(height: 32),
            Text("Add to Cart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextField(
              controller: _productPriceController,
              decoration: InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _productQuantityController,
              decoration: InputDecoration(labelText: "Quantity"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // For demo purposes, we use a hardcoded customer ID.
                _addToCart("cus_101");
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
