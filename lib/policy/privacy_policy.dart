import 'package:flutter/material.dart';

class policy extends StatefulWidget {
  const policy({super.key});

  @override
  State<policy> createState() => _policyState();
}

class _policyState extends State<policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,  
        title: Text('Privacy Policy',),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text('Privacy policy under development')
          
        ],
      ),
    );
  }
}
