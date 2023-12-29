import 'package:flutter/material.dart';
import 'package:project/widget/product.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isSelected = false;

  List<Product> products = [
    Product(
        name: 'Libas',
        imageUrl: 'assets/a4.png',
        price: 19.99,
        description: "Ethnic Print Kurta"),
    Product(
        name: 'Soch',
        imageUrl: 'assets/a5.png',
        price: 29.39,
        description: "Yellow & Pink Printed"),
    Product(
        name: 'Antheaa',
        imageUrl: 'assets/a6.png',
        price: 20.00,
        description: "Green & Brown Floral"),
    Product(
        name: 'Janasya',
        imageUrl: 'assets/a7.png',
        price: 15.69,
        description: "Pink Midi Dress"),
    Product(
        name: 'plusS',
        imageUrl: 'assets/a8.png',
        price: 17.59,
        description: "Blue Floral Dress"),
    Product(
        name: 'Athena',
        imageUrl: 'assets/a9.png',
        price: 15.99,
        description: "Pink Floral Dress"),
    Product(
        name: 'U&F',
        imageUrl: 'assets/a0.png',
        price: 19.99,
        description: "Green Tiered Dress"),
    Product(
        name: 'plusS',
        imageUrl: 'assets/a11.png',
        price: 25.19,
        description: "Polka-Dotted Dress"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    leading: GestureDetector(
                      onTap: () {
                      },
                      child: Image.asset(
                        'assets/m1.png',
                        width: 10,
                        height: 10,
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {

                        },
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
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(40.0),
                      child: TabBar(
                        indicatorColor: Colors.black,
                        indicatorWeight: 5.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            child: Text(
                              'New Arrivals',
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Trending',
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Brands',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
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
            )
        ),
            debugShowCheckedModeBanner: false,
    );
  }
}
