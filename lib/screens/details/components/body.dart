import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';
import 'package:http/http.dart' as http;
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'dart:convert';
import 'package:shop_app/utils/globals.dart' as globals;
import 'package:shop_app/utils/secure_storage.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globals.count = 0;
  }

  @override
  Widget build(BuildContext context) {
    // List<dynamic> data = await SecureStorage().getToken();
    Future<void> addToCart() async {
      String data1 = await SecureStorage.getToken();
      Map<String, dynamic> data2 = jsonDecode(data1);
      print(data2['email']);
      var response = await http
          .post(Uri.parse('https://syamsul.promaydo.net/cart.php'), body: {
        "email": data2['email'].toString(),
        "id": widget.product.id.toString(),
        "item": globals.count.toString(),
      });
      print('object');
      var data = jsonDecode(response.body);
      print(data['message']);

      if (data['value'] == 1) {
        print('babi');
      } else {
        print('failed add to cart');
      }
    }

    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    ColorDots(product: widget.product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Sending Message"),
                            ));
                            addToCart();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
