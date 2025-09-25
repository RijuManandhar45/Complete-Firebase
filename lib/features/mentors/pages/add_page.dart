import 'package:complete_firebase/features/mentors/pages/add_courses.dart';
import 'package:complete_firebase/features/mentors/pages/add_mentors.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Page",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AddCourses()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.amber,
                          child: Image.network(
                            "https://img.pikbest.com/png-images/people-enjoy-online-learning-courses-to-add-new-skills-vector-illustration-for-website_2420825.png!sw800",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Add Courses",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AddMentors()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.amber,
                          child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDSHaFK3A7vF6eE3RV-oSpi2p2OhtmTPK_yKdIyEy7Sh5iBAdeYmBSJmO4R_079-eMxLI&usqp=CAU"),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Add Mentors",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
