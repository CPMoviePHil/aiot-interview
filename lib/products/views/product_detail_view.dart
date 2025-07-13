import 'package:flutter/material.dart';

import '../../utils.dart';
import '../models/product_info.dart';

import '../../colors.dart';

class ProductDetailPage extends StatelessWidget {

  const ProductDetailPage({super.key, required this.product});

  final ProductInfo product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: colorFAFAFA),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("商品資訊", style: TextStyle(fontSize: 20)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AspectRatio(
                aspectRatio: 140 / 150,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage(product.productImage!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "商品編號: ${product.productId}",
              style: TextStyle(
                color: colorB3B3B3,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:Text(
              product.productMarketName!,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  currencyFormatter.format(product.productFinalPrice),
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.favorite_outline, color: colorB3B3B3),
                    SizedBox(width: 5),
                    Icon(Icons.shopping_cart_outlined, color: colorB3B3B3)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}