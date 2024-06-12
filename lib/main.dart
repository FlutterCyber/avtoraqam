import 'package:avtoraqam/pages/auth_pages/login_page.dart';
import 'package:avtoraqam/pages/auth_pages/sign_up_page.dart';
import 'package:avtoraqam/pages/bottom_nav_bar.dart';
import 'package:avtoraqam/pages/home_page.dart';
import 'package:avtoraqam/pages/pinfl_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        BottomNavBar.id: (context) => const BottomNavBar(),
        PinflDetailsPage.id: (context) => PinflDetailsPage(),
      },
    );
  }
}
