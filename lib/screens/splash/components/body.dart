import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, SignInScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              // Text(
              //   "Welcome",
              //   style: TextStyle(
              //     fontSize: getProportionateScreenWidth(30),
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: getProportionateScreenHeight(200)),
              // Text(
              //   "We're happy to see you again",
              //   style: TextStyle(
              //     fontSize: getProportionateScreenWidth(20),
              //   ),
              // ),
              const Image(image: AssetImage('assets/images/logo.png')),
              SizedBox(height: getProportionateScreenHeight(60)),

              Center(
                child: LoadingAnimationWidget.discreteCircle(
                    // leftDotColor: const Color(0xFF1A1A3F),
                    // rightDotColor: const Color(0xFFEA3799),
                    size: 70,
                    color: Colors.blue
                    // color: Colors.blue
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
