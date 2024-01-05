import 'package:flutter/material.dart';
import 'package:project/data/data.dart';
import 'package:project/util/colors.dart';
import 'package:project/widget/product.dart';
import 'package:project/widget/tab_bar.dart';

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

    double kSizeHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        key: PageStorageKey('HomeScreen'),
        appBar: AppBar(
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
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                delegate: SliverAppBarDelegate(
                  minHeight: kSizeHeight * 0.08751,
                  maxHeight: kSizeHeight * 0.08751,
                    child:
                      TabBarContainer(
                        currentIndex: _currentIndex,
                        onTabSelected: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                ),
                pinned: true,
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
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
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
