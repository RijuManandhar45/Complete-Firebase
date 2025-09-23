import 'package:complete_firebase/features/todo/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Consumer<TodoProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Text(
                    "TO DO PAGE",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your Id",
                        prefixIcon: Icon(Icons.person)),
                    controller: _idController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter the Title",
                        prefixIcon: Icon(Icons.text_fields)),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter the content",
                        prefixIcon: Icon(Icons.text_format)),
                    controller: _contentController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2, minimumSize: Size(double.infinity, 40)),
                      onPressed: () {
                        String? id = _idController.text.trim();
                        String? title = _titleController.text.trim();
                        String? content = _contentController.text.trim();

                        provider.addTodo(id, title, content);
                      },
                      child: Text("Add"))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
