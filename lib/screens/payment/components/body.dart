import 'package:flutter/material.dart';

import '../../sign_in/sign_in_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

import 'package:shop_app/utils/secure_storage.dart';
import 'dart:convert';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String mytoken = "";
  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    mytoken = await SecureStorage.getToken();
    setState(() {
      data = jsonDecode(mytoken);
    });
    // data = jsonDecode(mytoken);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 5),
              child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      GestureDetector(
                          onTap: () {
                            // print(jsonDecode(mytoken)['email']);
                          },
                          child: ProfilePic()),
                      SizedBox(height: 20),
                      Text(data['name']),
                      Text(data['phone']),
                      Text(data['email']),
                    ]),
                  ))),
          SizedBox(height: 20),
          // ProfileMenu(
          //   text: "My Account",
          //   icon: "assets/icons/User Icon.svg",
          //   press: () => {},
          // ),
          // ProfileMenu(
          //   text: "Notifications",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: "Help Center",
          //   icon: "assets/icons/Question mark.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Logged out successfully"),
              ));
              SecureStorage.deleteSecureAll();
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
