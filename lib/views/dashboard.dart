import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/views/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/course.dart';
import 'explore_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isListView = true;
  List<Course> courses = [
    Course(
        name: 'API Testing And Basic Overview Of JMETER',
        instructorName: 'Anum Mirza',
        duration: '2 hrs',
        complexity: 'Basic',
        picture: 'assets/images/API-Testing.jpg',
        link:
            'https://10pearlsuniversity.org/courses/api-testing-and-jmeter-overview/'),
    Course(
        name: 'Introduction To ServiceNow',
        instructorName: 'Hafsa Asif',
        duration: '1 hrs',
        complexity: 'Basic',
        picture: 'assets/images/service.jpg',
        link:
            'https://10pearlsuniversity.org/courses/introduction-to-servicenow/'),
    Course(
        name: 'Salesforce For Developers Part II',
        instructorName: 'Farah Naqvi',
        duration: '2 hrs',
        complexity: 'Intermediate',
        picture: 'assets/images/Salesforce.jpg',
        link:
            'https://10pearlsuniversity.org/courses/salesforce-for-developers-part-2/'),
    Course(
        name: 'Level Up In Swift And IOS Development',
        instructorName: 'Usman Mukhtar',
        duration: '2 hrs',
        complexity: 'Intermediate',
        picture: 'assets/images/Swift.jpg',
        link:
            'https://10pearlsuniversity.org/courses/level-up-in-swift-and-ios-development/'),
    Course(
        name: 'Basic Development With Flutter',
        instructorName: 'Muhammad Noman',
        duration: '1.5 hrs',
        complexity: 'Basic',
        picture: 'assets/images/flutter.jpg',
        link:
            'https://10pearlsuniversity.org/courses/basic-development-with-flutter/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = !isListView;
                });
              },
              icon: Icon(Icons.rotate_right_sharp))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Hi',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
              ),
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
              title: Text('Explore'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Explore()));
              },
            ),
            ListTile(
              title: Text('Services'),
            ),
            ListTile(
              title: Text('Blog'),
            ),
            ListTile(
              title: Text('Contact'),
            ),
          ],
        ),
      ),
      // body: ListView.builder(
      //     itemCount: courses.length,
      //     padding: EdgeInsets.all(20),
      //     itemBuilder: (context, index) {
      //       return Row(
      //         children: [
      //           Text(courses[index].name!),
      //         ],
      //       );
      //     })

      body: isListView
          ? ListView.separated(
              itemCount: courses.length,
              padding: EdgeInsets.all(20),
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(courses[index].link ?? 'default'));
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        courses[index].picture!,
                        width: 350,
                        height: 350,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                courses[index].name!,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                courses[index].instructorName!,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Duration: ' + courses[index].duration!,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Level: ' + courses[index].complexity!,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                courses.length,
                (index) => GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(courses[index].link ?? 'default'));
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        courses[index].picture!,
                        width: 130,
                        height: 130,
                      ),
                      Text(
                        courses[index].name!,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        courses[index].instructorName!,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Duration: ' + courses[index].duration!,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Level: ' + courses[index].complexity!,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }

  Future<void> launch(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
