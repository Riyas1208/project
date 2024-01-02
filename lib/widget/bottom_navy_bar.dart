import 'package:flutter/material.dart';
import 'package:project/Screen/cart_screen.dart';
import 'package:project/Screen/favourite_screen.dart';
import 'package:project/Screen/home_screen.dart';
import 'package:project/Screen/profile_screen.dart';
import 'package:project/util/colors.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(key: PageStorageKey('HomeScreen')),
    FavouriteScreen(key: PageStorageKey('FavouritePage')),
    CartScreen(key: PageStorageKey('CartScreen')),
    ProfileScreen(key: PageStorageKey('ProfilePage')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _pages[_currentIndex],
        bucket: PageStorageBucket(),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.accentColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('Home', 'assets/h3.png', null, 0),
            _buildNavItem('Favourite', null, Icons.favorite_border, 1),
            _buildNavItem('Cart', null, Icons.shopping_bag_outlined, 2),
            _buildNavItem('Profile', 'assets/p1.png', null, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, String? imagePath, IconData? icon,
      int index) {
    bool isSelected = _currentIndex == index;

    Widget content;

    if (imagePath != null) {
      if (label == 'Profile') {
        content = CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 15,
        );
      } else {
        content = Image.asset(
          imagePath,
          width: 20,
          height: 20,
          color: isSelected ? null : Colors.grey,
        );
      }
    } else if (icon != null) {
      content = Icon(
        icon,
        color: isSelected ? null : Colors.grey,
      );
    } else {
      content = Container();
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.bottomnavColor : AppColors.accentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            content,
            if (isSelected) SizedBox(width: 5),
            if (isSelected)
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppColors.fontColor : AppColors.hintTextColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
