import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/payment/payment.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

import 'package:shop_app/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shop_app/utils/secure_storage.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  String mytoken = "";
  int total = 0;
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
      total =
          globals.item1 * 20000 + globals.item2 * 30000 + globals.item3 * 40000;
    });
  }

  Future<void> buy() async {
    var request = http.Request(
        'GET',
        Uri.parse('https://syamsul.promaydo.net/newtest.php?amount=' +
            total.toString() +
            '&name=' +
            data['name'] +
            '&phone=' +
            data['phone'] +
            '&email=' +
            data['email']));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var payload = await response.stream.bytesToString();
      print(payload);

      globals.api = payload;

      // Navigator.pushNamed(context, Payment.routeName);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => payment()));
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "Rp. " + total.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {
                      print('checkout');
                      buy();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
