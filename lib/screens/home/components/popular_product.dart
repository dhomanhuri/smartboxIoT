import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/utils/globals.dart' as globals;

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  // int? selectedIndex;
  List<dynamic> user = [];
  List<dynamic> sold = [];
  int a = 0;
  int b = 0;
  int c = 0;

  @override
  void initState() {
    super.initState();
    getSold();
  }

  Future<void> getSold() async {
    var url = "https://syamsul.promaydo.net/getsold.php";
    var response = await http.get(Uri.parse(url));
    setState(() {
      sold = json.decode(response.body);
    });
    print(sold);
    setState(() {
      for (var i = 0; i < sold.length; i++) {
        a = a + int.parse(sold[i]['paket a']);
        b = b + int.parse(sold[i]['paket b']);
        c = c + int.parse(sold[i]['paket c']);
      }
      globals.data1 = a;
      globals.data2 = b;
      globals.data3 = c;
      print('data ' + globals.data1.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Produk", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(2)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  // print(index);
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
