

import 'package:flutter/material.dart';
import 'Screens/get_started.dart';
import 'Screens/login.dart';  
import 'Screens/registration.dart';
import 'Screens/home.dart';
import 'Screens/profile.dart';
import 'Screens/edit_profile.dart';// make sure the path is correct

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Log App',
      debugShowCheckedModeBanner: false,
      
      // Define app routes
      routes: {
        '/': (context) => const GetStartedPage(), // Initial page
        '/login': (context) => const LoginPage(),
        '/registration': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/edit-profile': (context) => const EditProfilePage(),
        // Add other routes like '/login': (context) => LoginPage() later
      },
    );
  }
}
