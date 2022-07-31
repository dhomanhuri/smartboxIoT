import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/home_admin/home_screen_admin.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, HomeScreenAdmin.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Admin Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        // SizedBox(
        //   width: SizeConfig.screenWidth * 0.6,
        //   child: DefaultButton(
        //     text: "Back to home",
        //     press: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => HomeScreenAdmin()),
        //       );
        //     },
        //   ),
        // ),
        Spacer(),
      ],
    );
  }
}
