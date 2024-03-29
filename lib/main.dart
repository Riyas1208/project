import 'package:flutter/material.dart';
import 'package:project/util/colors.dart';
import 'package:provider/provider.dart';
import 'package:project/Screen/splash_screen.dart';
import 'package:project/provider/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColorLight: AppColors.accentColor
      ),
    );
  }
}
