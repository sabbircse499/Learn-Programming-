import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Result extends StatefulWidget {
  final int correct;
  final int incorrect;
  final int totalCorrect;

  Result({
    Key? key,
    required this.correct,
    required this.incorrect,
    required this.totalCorrect,
  }) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _storeQuizResult();
  }

  // Function to store quiz results in the database
  Future<void> _storeQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username'); // Get username from SharedPreferences

    if (username != null) {
      final String apiUrl = 'http://192.168.0.114/peart/update.php'; // Replace with your actual API URL

      // Send the username and the new score
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'new_score': widget.correct.toString(), // Sending the correct answers as the score
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          print('Scores updated successfully');
        } else {
          setState(() {
            _errorMessage = data['message'];
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Failed to connect to the server';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Username not found in SharedPreferences';
      });
    }

    setState(() {
      _isLoading = false; // Update loading state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Congratulations! Your Results:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Correct Answers: ${widget.correct}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Incorrect Answers: ${widget.incorrect}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Total Questions: ${widget.totalCorrect}',
            style: TextStyle(fontSize: 20),
          ),
          if (_errorMessage != null) ...[
            SizedBox(height: 20),
            Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          ],
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed('/quizhome'); // Navigate back to the home page
            },
            child: Text(' Again Attend Another Quiz'),
          ),
        ],
      ),
    );
  }
}
