import 'package:avtoraqam/pages/bottom_nav_bar.dart';
import 'package:avtoraqam/providers/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../models/auth_model.dart';
import '../../services/network_service.dart';
import 'auth_textfield.dart';

class LoginPage extends ConsumerWidget {
  static const String id = "login_page";

  LoginPage({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  var logger = Logger();

  void signUserIn(WidgetRef ref, BuildContext context) async {
    String username = userNameController.text.trim();
    String password = passwordController.text.trim();

    AuthModel authModel =
        AuthModel(username: username, password: password, phoneModel: "Pixel7");

    Map<String, dynamic> responseMap =
        await NetworkService.POST(NetworkService.API_AUTH, authModel.toJson());
    if (responseMap["statusCode"] >= 200 && responseMap["statusCode"] <= 230) {
      logger.e(
          "Login page Token: ${responseMap["responseBody"]["data"]["access_token"]}");
      String accessToken = responseMap["responseBody"]["data"]["access_token"];
      String refreshToken =
          responseMap["responseBody"]["data"]["refresh_token"];
      ref.read(tokensProvider).setTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
          username: username);
      Navigator.pushReplacementNamed(context, BottomNavBar.id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xffDDF2FD),
          content: Text(
            'Server error: ${responseMap["statusCode"]}',
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        'Kirish',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                /// username textfield
                MyTextField(
                  controller: userNameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                /// password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    signUserIn(ref, context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
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
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
