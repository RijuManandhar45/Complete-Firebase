import 'package:complete_firebase/features/category/pages/add_categories.dart';
import 'package:complete_firebase/features/category/providers/categories_provider.dart';
import 'package:complete_firebase/firebase_options.dart';
import 'package:complete_firebase/features/category/pages/home_page.dart';
import 'package:complete_firebase/features/todo/provider/todo_provider.dart';
import 'package:complete_firebase/features/auth/pages/signin_page.dart';
import 'package:complete_firebase/features/auth/pages/signup_page.dart';
import 'package:complete_firebase/features/todo/screens/todo_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => TodoProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CategoriesProvider(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: AddCategories()));
  }
}
