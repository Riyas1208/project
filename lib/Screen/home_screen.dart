import 'package:flutter/material.dart';
import 'package:project/data/data.dart';
import 'package:project/util/colors.dart';
import 'package:project/widget/product.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        key: PageStorageKey('HomeScreen'),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.accentColor,
              leading: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/m1.png',
                  width: 10,
                  height: 10,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/s1.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
              expandedHeight: 90.0,
              floating: false,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40.0),
                child: TabBarContainer(
                  currentIndex: _currentIndex,
                  onTabSelected: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isSmallScreen ? 2 : 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ProductCard(product: products[index]);
                },
                childCount: products.length,
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabBarContainer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const TabBarContainer({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextButton(
              onPressed: () {
                onTabSelected(index);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return index == currentIndex
                        ? AppColors.fontColor
                        : AppColors.hintTextColor;
                  },
                ),
              ),
              child: Container(
                child: Text(
                  index == 0 ? 'New Arrivals' : index == 1
                      ? 'Trending'
                      : 'Brands',
                  style: TextStyle(
                    color: index == currentIndex
                        ? AppColors.fontColor
                        : AppColors.hintTextColor,
                  ),
                ),

                decoration: BoxDecoration(

                  border: Border(
                    bottom: BorderSide(
                      color: index == currentIndex
                          ? AppColors.fontColor
                          : Colors.transparent,
                      width: 5.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}