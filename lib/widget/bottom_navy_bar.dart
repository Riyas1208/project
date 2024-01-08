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
    HomeScreen(key: const PageStorageKey('HomeScreen')),
    const FavouriteScreen(key: PageStorageKey('FavouritePage')),
    const CartScreen(key: PageStorageKey('CartScreen')),
    const ProfileScreen(key: PageStorageKey('ProfilePage')),
  ];

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: PageStorage(
        child: _pages[_currentIndex],
        bucket: PageStorageBucket(),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          bottom: 15,
          top: 15,
          right: 10,
          left: 10
        ),
        height: isSmallScreen ? 70 : 80,
        decoration: const BoxDecoration(
          color: AppColors.accentColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('Home', 'assets/h3.png', null, 0, isSmallScreen),
            _buildNavItem('Favourite', null, Icons.favorite_border, 1, isSmallScreen,),
            _buildNavItem('Cart', null, Icons.shopping_bag_outlined, 2, isSmallScreen,),
            _buildNavItem('Profile', 'assets/p1.png', null, 3, isSmallScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label,
      String? imagePath,
      IconData? icon,
      int index,
      bool isSmallScreen,) {
    bool isSelected = _currentIndex == index;

    Widget content;

    if (imagePath != null) {
      if (label == 'Profile') {
        content = CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: isSmallScreen ? 12 : 15,
        );
      } else {
        content = Image.asset(
          imagePath,
          width: isSmallScreen ? 23 : 25,
          height: isSmallScreen ? 23 : 25,
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
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 10 : 10,
        ),
        height: isSmallScreen ? 60 : 60,
        width: isSmallScreen ? 90 : 110,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.bottomnavColor : AppColors.accentColor,
          borderRadius: BorderRadius.circular(isSmallScreen ? 15 : 20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              content,
              if (isSelected) const SizedBox(width : 5),
              if (isSelected)
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? AppColors.fontColor : AppColors.hintTextColor,
                    fontSize: isSmallScreen ? 9 : 14,
                    fontWeight: isSelected ? FontWeight.normal : FontWeight.normal,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
