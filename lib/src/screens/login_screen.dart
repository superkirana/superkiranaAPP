import 'package:flutter/material.dart';

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
