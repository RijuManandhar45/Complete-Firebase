import 'package:complete_firebase/features/mentors/provider/mentors_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({super.key});

  @override
  State<AddCourses> createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  final TextEditingController _category = TextEditingController();
  final TextEditingController _rating = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _classes = TextEditingController();
  final TextEditingController _durationHours = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _tab = TextEditingController();
  final TextEditingController _conclusion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Courses",
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
                      "Category",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Graphic Design",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _category,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Rating",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "42",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _rating,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Title",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Design Principle",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _title,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Classes",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "21",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _classes,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Duration Hours",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "12 hrs",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _durationHours,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Price",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "\$ 150",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _price,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Tab",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Graphic Design",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _tab,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Conclusion",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:
                              "Write your complain here (minimum 10 characters)",
                          hintStyle: TextStyle(color: Colors.grey)),
                      controller: _conclusion,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 2,
                            minimumSize: Size(double.infinity, 40)),
                        onPressed: () {
                          String? category = _category.text.trim();
                          String? rating = _rating.text.trim();
                          String? title = _title.text.trim();
                          String? classes = _classes.text.trim();
                          String? durationHours = _durationHours.text.trim();
                          String? price = _price.text.trim();
                          String? tab = _tab.text.trim();
                          String? conclusion = _conclusion.text.trim();

                          provider.addCourses(category, rating, title, classes,
                              durationHours, price, tab, conclusion);
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
