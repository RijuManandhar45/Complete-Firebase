import 'package:complete_firebase/features/auth/pages/signin_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  "https://img.freepik.com/premium-vector/home-learning-logo-designs-concept-vector-home-education-logo-template-real-estate-symbol_841298-1523.jpg?semt=ais_incoming&w=740&q=80",
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Getting Started.!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Create an Account to Continue your all Courses",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined)),
                controller: _emailController,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_off)),
                controller: _passwordController,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  Text("Agree to Terms & Conditions"),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("Sign up"),
                      Spacer(),
                      Icon(
                        Icons.arrow_circle_right,
                        color: Colors.white,
                        size: 40,
                      )
                    ],
                  )),
              SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Text("Or Continue With"),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color.fromARGB(255, 247, 247, 245),
                          child: Image.network(
                              "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color.fromARGB(255, 247, 247, 245),
                          child: Image.network(
                            "https://gpng.net/wp-content/uploads/Apple-Logo-Icon-PNG.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Alredy have an account?"),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignInPage()));
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                      ),
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
