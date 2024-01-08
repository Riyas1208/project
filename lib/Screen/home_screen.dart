import 'package:flutter/material.dart';
import 'package:project/Screen/api_screen.dart';
import 'package:project/data/data.dart';
import 'package:project/util/colors.dart';
import 'package:project/util/custom_sliver_delegate.dart';
import 'package:project/widget/product.dart';
import 'package:project/widget/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    double kSizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
        physics: ClampingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              delegate: SliverAppBarDelegate(
                minHeight: kSizeHeight * 0.08751,
                maxHeight: kSizeHeight * 0.08751,
                child: Container(
                  color: AppColors.accentColor,
                  child: TabBarContainer(
                    currentIndex: _currentIndex,
                    onTabSelected: (index) {
                      _tabController.animateTo(index);
                    },
                    tabTitles: ['New arrivals', 'Trending', 'Brands'],
                  ),
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: TabBarView(
            controller: _tabController,
            children: [
              CustomScrollView(
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
              // Trending
              ProductListPage(),
              Center(child: Text('Brands Content')),
            ],
          ),
        ),
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
