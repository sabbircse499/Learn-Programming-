import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn_program/layout/roadmap/roadcon.dart';


class roadmap extends StatefulWidget {
  @override
  State<roadmap> createState() => _homeState();
}

class _homeState extends State<roadmap> {
  final List<String> language = [
    'Software Development With Flutter',
    'Android Development With Native Java',
    'Software Development With React Native',
    'Web Development ',
    'Game Development',
    'Machine Learning',
    'Robotics',
    'Backend With Django',
    'Backend With Laravel',
    'Ui Design'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RoadMap'),
        backgroundColor: Colors.red,
        actions: [
          // IconButton(onPressed: (){
          //   Get.to(LoginPage());
          // }, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.flag_circle)),
        ],
      ),
      body: Column(
        children: [
          //
          Expanded(
            child: GridView.count(
              crossAxisCount: 1,
              //maxCrossAxisExtent: 150, // Maximum width of each item
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,

              padding: EdgeInsets.all(10),
              children: List.generate(language.length, (index) {
                return InkWell(
                  onTap: () {
                    Get.to(Roadmappdf(), arguments: language[index]);

                    print('${language[index]}');
                  },
                  child: Container(
                    height: 100,
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
