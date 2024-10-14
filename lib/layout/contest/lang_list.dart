import 'package:flutter/material.dart';
import 'package:learn_program/quiz/Screen/quiz_screen.dart';
import 'package:get/get.dart';
class langlist extends StatefulWidget {
  const langlist({super.key});

  @override
  State<langlist> createState() => _langlistState();
}

class _langlistState extends State<langlist> {

  final List<String> language = [
  'Python',
  'C',
  'C++',
  'Java',
  'C#',
  'Dart',
  'rust',
  'Go',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contest Language'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              //maxCrossAxisExtent: 150, // Maximum width of each item
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,

              padding: EdgeInsets.all(10),
              children: List.generate(language.length, (index) {
                return InkWell(
                  onTap: () {
                    Get.to(QuizScreen(), arguments: language[index]);
                    print('${language[index]}');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        language[index],
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
