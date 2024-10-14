import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  List<dynamic> _scoresList = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchLeaderboardData();
  }

  Future<void> _fetchLeaderboardData() async {
    final response = await http.get(Uri.parse('http://192.168.0.114/peart/leaderboad.php'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        setState(() {
          _scoresList = data['data'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = data['message'];
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load leaderboard. Please check your internet connection or try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
          ? Center(child: Text(_errorMessage, style: TextStyle(color: Colors.red)))
          : ListView.builder(
        itemCount: _scoresList.length,
        itemBuilder: (context, index) {
          final user = _scoresList[index];
          return ListTile(
            title: Text(user['username']),
            subtitle: Text('Email: ${user['email']}'),
            trailing: Text('Score: ${user['highestScore']}'),
          );
        },
      ),
    );
  }
}
