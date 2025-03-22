import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:3000";
  final String token;

  ApiService({required this.token});

  // Common headers for API calls.
  Map<String, String> get headers => {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      };

  // 1. Add Customer API
  Future<Map<String, dynamic>> addCustomer({required String name, String? mobile}) async {
    final url = Uri.parse('$baseUrl/customer');
    final body = json.encode({
      "name": name,
      if (mobile != null && mobile.isNotEmpty) "mobile": mobile,
    });
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to add customer: ${response.body}");
    }
  }

  // 2. Get Customer Details API
  Future<Map<String, dynamic>> getCustomerDetails(String customerId) async {
    final url = Uri.parse('$baseUrl/customer/$customerId');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Customer not found: ${response.body}");
    }
  }

  // 3. Add to Cart API
  Future<Map<String, dynamic>> addToCart(String customerId, List<Map<String, dynamic>> items) async {
    final url = Uri.parse('$baseUrl/cart/$customerId');
    final body = json.encode({"items": items});
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to add to cart: ${response.body}");
    }
  }

  // 4. Get Cart Items API
  Future<Map<String, dynamic>> getCartItems(String customerId) async {
    final url = Uri.parse('$baseUrl/cart/$customerId');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Cart not found: ${response.body}");
    }
  }

  // 5. Update Cart Item API
  Future<Map<String, dynamic>> updateCartItem(String customerId, String itemId, int quantity) async {
    final url = Uri.parse('$baseUrl/cart/$customerId/item/$itemId');
    final body = json.encode({"quantity": quantity});
    final response = await http.put(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to update cart item: ${response.body}");
    }
  }

  // 6. Delete Cart Item API
  Future<Map<String, dynamic>> deleteCartItem(String customerId, String itemId) async {
    final url = Uri.parse('$baseUrl/cart/$customerId/item/$itemId');
    final response = await http.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to delete cart item: ${response.body}");
    }
  }

  // 7. Checkout Cart API
  Future<Map<String, dynamic>> checkoutCart(
      String customerId, String paymentMethod, Map<String, dynamic> paymentDetails) async {
    final url = Uri.parse('$baseUrl/cart/$customerId/checkout');
    final body = json.encode({
      "paymentMethod": paymentMethod,
      "paymentDetails": paymentDetails,
    });
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Checkout failed: ${response.body}");
    }
  }
}
