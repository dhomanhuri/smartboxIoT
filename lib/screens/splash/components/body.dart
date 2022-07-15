import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';
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
                child: LoadingAnimationWidget.flickr(
                  // leftDotColor: const Color(0xFF1A1A3F),
                  // rightDotColor: const Color(0xFFEA3799),
                  size: 70,
                  rightDotColor: Colors.blue,
                  leftDotColor: Colors.red,
                  // color: Colors.blue
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // int currentPage = 0;
  // List<Map<String, String>> splashData = [
  //   {"text": "SMARTBOX", "image": "assets/images/splash_1.png"},
  //   {
  //     "text":
  //         "Gunakan Aplikasi Untuk Mempermudah Anda Membeli Kue Tradisional dengan Real Payment",
  //     "image": "assets/images/splash_2.png"
  //   },
  //   {"text": "Nikmati Makanan Anda", "image": "assets/images/splash_3.png"},
  // ];
  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: SizedBox(
  //       width: double.infinity,
  //       child: Column(
  //         children: <Widget>[
  //           Expanded(
  //             flex: 3,
  //             child: PageView.builder(
  //               onPageChanged: (value) {
  //                 setState(() {
  //                   currentPage = value;
  //                 });
  //               },
  //               itemCount: splashData.length,
  //               itemBuilder: (context, index) => SplashContent(
  //                 image: splashData[index]["image"],
  //                 text: splashData[index]['text'],
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             flex: 2,
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(
  //                   horizontal: getProportionateScreenWidth(20)),
  //               child: Column(
  //                 children: <Widget>[
  //                   Spacer(),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: List.generate(
  //                       splashData.length,
  //                       (index) => buildDot(index: index),
  //                     ),
  //                   ),
  //                   Spacer(flex: 3),
  //                   DefaultButton(
  //                     text: "Continue",
  //                     press: () {
  //                       Navigator.pushNamed(context, SignInScreen.routeName);
  //                     },
  //                   ),
  //                   Spacer(),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // AnimatedContainer buildDot({int? index}) {
  //   return AnimatedContainer(
  //     duration: kAnimationDuration,
  //     margin: EdgeInsets.only(right: 5),
  //     height: 6,
  //     width: currentPage == index ? 20 : 6,
  //     decoration: BoxDecoration(
  //       color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
  //       borderRadius: BorderRadius.circular(3),
  //     ),
  //   );
  // }
}
