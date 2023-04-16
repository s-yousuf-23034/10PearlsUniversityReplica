import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/course.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => ExploreViewState();
}

class ExploreViewState extends State<Explore> {
  @override
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: ListView.separated(
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
            onTap: () {},
            child: Column(
              children: [
                Text(
                  courses[index].name!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                QrImage(
                  data: courses[index].link ?? 'default',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
