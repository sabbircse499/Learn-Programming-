import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'content/tutorial_lang.dart';
import 'policy/privacy_policy.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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

  final List<String> images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peart'),
        backgroundColor: Colors.red,
        actions: [
          // IconButton(onPressed: (){
          //   Get.to(LoginPage());
          // }, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.flag_circle)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Image.asset(
                'assets/images/lf.png',
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Privacy policy'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => policy()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Developer info'),
                      content: Text(
                        'I am Md sabbir Hossen , a software engineer specializing in Flutter, Django, and full-stack development. I love creating mobile and web applications!',
                      ),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //
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
                    Get.to(tutorial(), arguments: language[index]);

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
