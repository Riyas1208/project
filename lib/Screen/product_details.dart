import 'package:flutter/material.dart';
import 'package:project/util/colors.dart';
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
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    double backButtonSize = isSmallScreen ? 30 : 40;
    double imageHeight = isSmallScreen ? 350 : 400;
    double titleFontSize = isSmallScreen ? 14 : 18;
    double descriptionFontSize = isSmallScreen ? 12 : 14;
    double priceFontSize = isSmallScreen ? 22 : 26;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 11.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: isSmallScreen ? 40 : 50),
            IconButton(
              alignment: Alignment.topLeft,
              iconSize: backButtonSize,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: isSmallScreen ? 20 : 50),
            Container(
              height: imageHeight,
              width: double.infinity,
              child: Image.asset(
                widget.product.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: isSmallScreen ? 10 : 16),
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.favoriteIconColor,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              widget.product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  '\$${widget.product.price.toString()}',
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: priceFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: isSmallScreen ? 20 : 43),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.errorColor : AppColors.hintTextColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: isSmallScreen ? 8 : 16),

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
              child: Text('Add to Cart', style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
