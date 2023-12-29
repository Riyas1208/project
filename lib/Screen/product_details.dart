import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/provider/cart_provider.dart';
import 'package:project/widget/product.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 50),
            Container(
              height: 400,
              width: double.infinity,
              child: Image.asset(
                widget.product.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 98, 77, 141),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              widget.product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  '\$${widget.product.price.toString()}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 43),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey[350],
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                cartProvider.addToCart(widget.product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product added to cart'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white60),
              ),
              child: Text('Add to Cart',style: TextStyle(color: Colors.black),),
            ),

          ],
        ),
      ),
    );
  }
}