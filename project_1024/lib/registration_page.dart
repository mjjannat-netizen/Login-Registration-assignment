
 
import 'package:flutter/material.dart';
import 'package:project_1024/widget/input.dart';

// store data after registration 
class UserData {
  static String name = "";
  static String email = "";
  static String password = "";
}



class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
 
  @override
  State<RegistrationPage> createState() => _RegisterPageState();
}
 
class _RegisterPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
 
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
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
              color: const Color.fromARGB(255, 29, 231, 160),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person_add, size: 60, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
 
                      // Name
                      InputField(
                        controller: nameController,
                        keyboardTtpe: TextInputType.name,
                        labelText: "Name",
                        hintText: "Enter Name",
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Name is empty!!!";
                          }
                          if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(value)) {
                            return "Only letters, min 3 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
 
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
                      SizedBox(height: 15),
 
                      // Confirm Password
                      InputField(
                        controller: confirmController,
                        keyboardTtpe: TextInputType.visiblePassword,
                        obscureText: true,
                        labelText: "Confirm Password",
                        hintText: "Re-enter Password",
                        prefixIcon: Icon(Icons.lock_outline),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Confirm password is empty!!!";
                          }
                          if (value != passController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
 
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            UserData.name = nameController.text;
                            UserData.email = emailController.text;
                            UserData.password = passController.text;
 
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Registration Successful")),
                            );
                            Navigator.pop(context); // login page e fire jabe
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 19, 94, 64),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Register"),
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