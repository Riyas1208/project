import 'package:flutter/material.dart';
import 'package:project/Screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272F32),
      body: Center(
        child: ClipOval(
          child: Image.asset(
            'assets/t.png',
            width: 150.0,
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
