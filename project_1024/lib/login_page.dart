import 'package:flutter/material.dart';
import 'package:project_1024/homepage.dart';
import 'package:project_1024/registration_page.dart';
import 'package:project_1024/widget/input.dart';
 
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
 
  @override
  State<LoginPage> createState() => _LoginPageState();
}
 
class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
 
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 171, 62, 118),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 320,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 8,
              color: const Color.fromARGB(255, 69, 215, 152),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock_person, size: 60, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
 
                      // Email
                      InputField(
                        controller: emailController,
                        keyboardTtpe: TextInputType.emailAddress,
                        labelText: "Email",
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email is empty!!!";
                          }
                          if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
 
                      // Password
                      InputField(
                        controller: passController,
                        keyboardTtpe: TextInputType.visiblePassword,
                        obscureText: true,
                        labelText: "Password",
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.lock),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password is empty!!!";
                          }
                          if (!RegExp(
                                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$')
                              .hasMatch(value)) {
                            return "Min 8 char, upper, lower, number & symbol";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
 
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (UserData.email.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("Please register first")),
                              );
                              return;
                            }
                            if (emailController.text == UserData.email &&
                                passController.text == UserData.password) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    name: UserData.name,
                                    email: UserData.email,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("Wrong email or password")),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 31, 73, 55),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Login"),
                      ),
                      SizedBox(height: 10),
 
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()),
                          );
                        },
                        child: Text("Don't have an account? Register"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}