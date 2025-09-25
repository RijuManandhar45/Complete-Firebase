import 'package:complete_firebase/features/mentors/pages/mentors.dart';
import 'package:complete_firebase/features/mentors/provider/mentors_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMentors extends StatefulWidget {
  const AddMentors({super.key});

  @override
  State<AddMentors> createState() => _AddMentorsState();
}

class _AddMentorsState extends State<AddMentors> {
  final TextEditingController _mentorName = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _specailist = TextEditingController();
  final TextEditingController _bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Mentors",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Consumer<MentorsProvider>(
              builder: (_, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mentor Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Ishan Shrestha",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _mentorName,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Age",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "22",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _age,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "ishan@gmail.com",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Phone Number",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "9812345678",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _phoneNumber,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Specialist",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Flutter",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _specailist,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Bio",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Ishan Shrestha is a flutter developer.",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _bio,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 2,
                            minimumSize: Size(double.infinity, 40)),
                        onPressed: () {
                          Mentors mentors = Mentors(
                              mentorsName: _mentorName.text.trim(),
                              age: int.tryParse(_age.text.trim()),
                              email: _email.text.trim(),
                              phoneNumber: int.tryParse(
                                _phoneNumber.text.trim(),
                              ),
                              specialist: _specailist.text.trim(),
                              bio: _bio.text.trim());

                          provider.addMentors(mentors);
                        },
                        child: Text("Add"))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
