import 'package:flutter/material.dart';
import 'package:project/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:project/widget/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      key: PageStorageKey('CartScreen'),
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text('Shopping Cart'),
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
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      product.imageUrl,
                      width: 60,
                      height: 60,
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
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price: \$${cartProvider.calculateTotalPrice()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your checkout logic here
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
