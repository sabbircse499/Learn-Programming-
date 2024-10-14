import 'package:flutter/material.dart';
class faq extends StatefulWidget {
  const faq({super.key});

  @override
  State<faq> createState() => _faqState();
}

class _faqState extends State<faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text(
                  'What is this application about\n',

                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              ),

              Text( 'Our application is designed to help users learn programming through interactive tutorials\n'
              'coding exercises, and real-world projects.\n'
              'We cover various programming languages and concepts to enhance your coding skills.')

            ],
          ),
        ),
      ),
    );
  }
}
