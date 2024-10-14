import 'package:flutter/material.dart';
// layout for bottom navigation
import 'package:learn_program/layout/problemset.dart';
import 'package:learn_program/layout/profile.dart';
import 'package:learn_program/home.dart';
import 'package:learn_program/layout/contest.dart';
import 'package:learn_program/layout/Roadmap.dart';

class control extends StatefulWidget {
  const control({super.key});

  @override
  State<control> createState() => _controlState();
}

class _controlState extends State<control> {
  // Current index for BottomNavigationBar
  var _selectedIndex = 0;

  // List of pages that correspond to each BottomNavigationBar item
  final List<Widget> _pages = [
    home(),
    contest(),
    Problem(),
    roadmap(),
    Profile(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Update the selected index
        selectedItemColor: Colors.blue, // Optional: Color for selected icon
        unselectedItemColor: Colors.black38,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Contest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Problem Set',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar_outlined),
            label: 'Roadmap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
