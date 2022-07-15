// import 'package:flutter/material.dart';
import 'package:shop_app/utils/globals.dart' as globals;
import 'Product.dart';
// import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: globals.item1),
  Cart(product: demoProducts[1], numOfItem: globals.item2),
  Cart(product: demoProducts[2], numOfItem: globals.item3),
];
