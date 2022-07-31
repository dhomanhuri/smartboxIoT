import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

import 'package:email_auth/email_auth.dart';
import 'package:shop_app/utils/globals.dart' as globals;
import '../../../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  Future<void> login() async {
    print(globals.email);
    var response = await http
        .post(Uri.parse('https://syamsul.promaydo.net/register.php'), body: {
      "email": globals.email,
      "password": globals.password,
      "username": globals.username,
      "phone": globals.phone,
      "fullname": globals.fullname,
    });
    var data = jsonDecode(response.body);
    if (data['value'] == 1) {
      print('success register');
      Navigator.pushNamed(context, SignInScreen.routeName);
    } else {
      print('failed register');
    }
  }

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  late EmailAuth emailAuth;
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
    sendOTP();
  }

  void sendOTP() async {
    var res =
        await emailAuth.sendOtp(recipientMail: globals.email, otpLength: 4);
    print(res);
    if (res) {
      print("OTP sent successfully");
    } else {
      print("OTP sending failed");
    }
  }

  void veryfyOTP(String data) async {
    var res = await emailAuth.validateOtp(
        recipientMail: globals.email, userOtp: data);
    if (res) {
      print("OTP verified successfully");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Register Success, Please Login"),
      ));
      await login();
      Navigator.pushNamed(context, SignInScreen.routeName);
    } else {
      print("OTP verification failed");
    }
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  String? datanode, datanode2, datanode3, datanode4, datanode5, datanode6;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                    datanode = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);
                    datanode2 = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin4FocusNode);
                    datanode3 = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin5FocusNode);
                    datanode4 = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin6FocusNode);
                    datanode5 = value;
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(40),
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin6FocusNode!.unfocus();
                      datanode6 = value;
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              String otp = datanode.toString() +
                  datanode2.toString() +
                  datanode3.toString() +
                  datanode4.toString() +
                  datanode5.toString() +
                  datanode6.toString();
              print('asd' + otp.toString());
              veryfyOTP(otp);
            },
          )
        ],
      ),
    );
  }
}
