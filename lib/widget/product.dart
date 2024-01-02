import 'package:flutter/material.dart';
import 'package:project/Screen/product_details.dart';
import 'package:project/util/colors.dart';

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    double cardWidth = isSmallScreen ? 200 : 300;
    double imageHeight = isSmallScreen ? 100 : 120;
    double titleFontSize = isSmallScreen ? 10 : 11;
    double descriptionFontSize = isSmallScreen ? 10 : 11;
    double priceFontSize = isSmallScreen ? 18 : 16;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: widget.product),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 8.0 : 13.0,
          vertical: isSmallScreen ? 0.5 : 1.0,
        ),
        child: SizedBox(
          width: cardWidth,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isSmallScreen ? 8.0 : 0.0),
            ),
            color: AppColors.cardBackgroundColor,
            elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: imageHeight,
                  width: double.infinity,
                  child: Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              const SizedBox(width: 43),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
