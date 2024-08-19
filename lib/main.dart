import 'package:flutter/material.dart';
import 'dart:async';

import 'package:job_task/presentation/screens/screen1_main_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 15 seconds
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  screen1_main_feed()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBAE), // Set background color
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Should be scrollable and be coded\n'
                  'in a way so later on we can easily\n'
                  'add pull to refresh.\n\n\n\n'
                  'Also make sure the tabs “Public\n'
                  'Feed” and “Business Feed” work, for\n'
                  'business feed same UI as public\n'
                  'feed.\n\n\n\n'
                  'This screen needs to be properly\n'
                  'setup for navigation with a\n'
                  'bottombar.',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 250, top: 20),
              child: Text(
                "Imran",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


