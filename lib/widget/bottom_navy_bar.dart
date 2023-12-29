import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:project/Screen/cart_screen.dart';
import 'package:project/Screen/favourite_screen.dart';
import 'package:project/Screen/home_screen.dart';
import '../Screen/profile_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavouritePage(),
    CartScreen(),
    ProfilePage(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: _pages[_currentIndex],
    bottomNavigationBar: BottomNavyBar(
    selectedIndex: _currentIndex,
    onItemSelected: (index) => setState(() => _currentIndex = index),      items: [
        BottomNavyBarItem(
          icon: Image.asset(
            'assets/h3.png',
            width: 20,
            height: 20,
          ),
          title: const Text('Home'),
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.left,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.favorite_border),
          title: const Text('Favourite'),
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.left,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_bag_outlined),
          title: const Text('Cart'),
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.left,
        ),
        BottomNavyBarItem(
          icon: const CircleAvatar(
            backgroundImage: AssetImage('assets/p1.png'),
            radius: 15,
          ),
          title: const Text('Profile'),
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.left,
        ),
      ],
      containerHeight: kBottomNavigationBarHeight + 10,
      itemCornerRadius: 20,
    )
    );
  }
}
