import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isreg = false;

  // Function to validate email
  bool _isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }

  // Function to validate form
  bool _validateForm() {
    if (_usernameController.text.isEmpty) {
      _showSnackBar('Username cannot be empty');
      return false;
    }
    if (_emailController.text.isEmpty || !_isValidEmail(_emailController.text)) {
      _showSnackBar('Please enter a valid email');
      return false;
    }
    if (_passwordController.text.isEmpty || _passwordController.text.length < 6) {
      _showSnackBar('Password must be at least 6 characters long');
      return false;
    }
    return true;
  }

  // Function to show SnackBar with error message
  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> register(String username, String email, String password) async {
    if (!_validateForm()) return; // Validate form before proceeding

    final response = await http.post(
      Uri.parse('http://192.168.0.114/peart/register.php/'), // Use your actual IP address
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['message']);

      isreg=true;
      // Show success message
      final snackBar = SnackBar(
        content: Text('Registration successful!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // Clear text fields after successful registration
      _usernameController.clear();
      _emailController.clear();
      _passwordController.clear();
    } else {
      _showSnackBar('Registration failed. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Text('Sign Up',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.blue
              ),),

              SizedBox(
                height: 20,
              ),

              TextField(
                controller: _usernameController,
                // decoration: InputDecoration(labelText: 'Username'),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.blueAccent, // Label color
                      fontWeight: FontWeight.bold, // Bold label
                    ),
                    hintText: 'Enter your username', // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey, // Hint text color
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blueAccent), // Icon before text
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 1.5), // Border color when enabled
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0), // Border color when focused
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    ),
                    filled: true, // Fill color
                    fillColor: Colors.blue[50], // Light blue background
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Padding inside the field
                  )

              ),

              SizedBox(height: 20),

              TextField(
                controller: _emailController,
                // decoration: InputDecoration(labelText: 'Email'),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueAccent, // Label color
                      fontWeight: FontWeight.bold, // Bold label
                    ),
                    hintText: 'Enter your Email', // Placeholder text
                    hintStyle: TextStyle(
                      color: Colors.grey, // Hint text color
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blueAccent), // Icon before text
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 1.5), // Border color when enabled
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0), // Border color when focused
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    ),
                    filled: true, // Fill color
                    fillColor: Colors.blue[50], // Light blue background
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Padding inside the field
                  )

              ),

              SizedBox(height: 20),

              TextField(
                controller: _passwordController,
                // decoration: InputDecoration(labelText: 'Password'),
                decoration: InputDecoration(
                  labelText: 'Passward',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent, // Label color
                    fontWeight: FontWeight.bold, // Bold label
                  ),
                  hintText: 'Enter your passward', // Placeholder text
                  hintStyle: TextStyle(
                    color: Colors.grey, // Hint text color
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.blueAccent), // Icon before text
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.5), // Border color when enabled
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0), // Border color when focused
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  filled: true, // Fill color
                  fillColor: Colors.blue[50], // Light blue background
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Padding inside the field
                ),

                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (isreg==true){
                    Get.offNamed('/log');
                  }
                  register(
                    _usernameController.text,
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
