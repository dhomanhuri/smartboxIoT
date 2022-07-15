import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/utils/globals.dart' as globals;
import '../../../size_config.dart';
// import 'cart_card.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import 'dart:convert';
import 'package:shop_app/utils/secure_storage.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String mytoken = "";
  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    mytoken = await SecureStorage.getToken();

    setState(() {
      data = jsonDecode(mytoken);
      globals.item1 = 0;
      globals.item2 = 0;
      globals.item3 = 0;
    });
    cart();
  }

  Future<void> cart() async {
    var response = await http.post(
        Uri.parse('https://syamsul.promaydo.net/getcart.php'),
        body: {"email": data['email'].toString()});
    var payload = jsonDecode(response.body);
    print(payload['item1']);
    setState(() {
      globals.item1 = int.parse(payload['item1']);
      globals.item2 = int.parse(payload['item2']);
      globals.item3 = int.parse(payload['item3']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/images/paketa-1.png"),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paket A",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "\Rp. 20000",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x " + globals.item1.toString(),
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/images/paketb-1.png"),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paket B",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "\Rp. 30000",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x " + globals.item2.toString(),
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/images/paketc-1.png"),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paket C",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "\Rp. 40000",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x " + globals.item3.toString(),
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
