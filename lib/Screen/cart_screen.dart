import 'package:flutter/material.dart';
import 'package:project/provider/cart_provider.dart';
import 'package:project/util/colors.dart';
import 'package:provider/provider.dart';
import 'package:project/widget/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    double itemPadding = isSmallScreen ? 8.0 : 16.0;
    double imageSize = isSmallScreen ? 60.0 : 80.0;
    double subtitleFontSize = isSmallScreen ? 12.0 : 14.0;
    double totalPriceFontSize = isSmallScreen ? 15.0 : 18.0;

    return Scaffold(
      key: PageStorageKey('CartScreen'),
      backgroundColor: AppColors.accentColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: Text('Shopping Cart',style: TextStyle(
            color: AppColors.fontColor),),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                Product product = cartProvider.cartItems[index].product;
                int quantity = cartProvider.cartItems[index].quantity;

                return Padding(
                  padding: EdgeInsets.all(itemPadding),
                  child: ListTile(
                    leading: Image.asset(
                      product.imageUrl,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: \$${product.price.toString()}'),
                        Row(
                          children: [
                            Text('Quantity: $quantity'),
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                cartProvider.decreaseQuantity(product);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                cartProvider.increaseQuantity(product);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeFromCart(product);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: AppColors.accentColor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price: \$${cartProvider.calculateTotalPrice()}',
                    style: TextStyle(fontSize: totalPriceFontSize, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
