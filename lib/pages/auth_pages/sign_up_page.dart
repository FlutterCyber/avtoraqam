import 'package:avtoraqam/pages/auth_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'auth_textfield.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final genderController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginPage.id,
                          );
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                /// first name textfield
                MyTextField(
                  controller: firstNameController,
                  hintText: 'First name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                /// last name textfield
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Last name',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                /// Username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                /// Password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                /// Address textfield
                MyTextField(
                  controller: addressController,
                  hintText: 'Address',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                /// Mobile number textfield
                MyTextField(
                  controller: mobileNumberController,
                  hintText: 'Mobile number',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                /// Gender textfield
                MyTextField(
                  controller: genderController,
                  hintText: 'Gender',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                /// sign in button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
