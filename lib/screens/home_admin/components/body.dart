// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../size_config.dart';
// import 'categories.dart';
// import 'discount_banner.dart';
// import 'home_header.dart';
// import 'popular_product.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int? selectedIndex;
  List<dynamic> user = [];
  List<dynamic> sold = [];
  int a = 0;
  int b = 0;
  int c = 0;

  Future<void> getData() async {
    var url = "https://syamsul.promaydo.net/getuser.php";
    var response = await http.get(Uri.parse(url));
    setState(() {
      user = json.decode(response.body);
    });
    print(user);
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
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await getData();
    await getSold();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kPrimaryColor,
              height: SizeConfig.screenHeight * 0.1,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Admin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue[300]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text(
                          a.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text(
                          b.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Text(
                          c.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue[300]),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: user.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   selectedIndex = index;
                              //   print(_foundUsers[index]['id'].toString());
                              // });
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) => AlertDialog(
                              //     title: Text(
                              //       "asdasd",
                              //       textAlign: TextAlign.center,
                              //     ),
                              //     content: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: <Widget>[
                              //         Column(
                              //           mainAxisSize: MainAxisSize.max,
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.stretch,
                              //           children: [
                              //             ButtonTheme(
                              //               child: Column(
                              //                 mainAxisSize: MainAxisSize.max,
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.center,
                              //                 crossAxisAlignment:
                              //                     CrossAxisAlignment.stretch,
                              //                 children: [
                              //                   FlatButton.icon(
                              //                     onPressed: () {
                              //                       // Navigator.of(context).pop();
                              //                       // Navigator.of(context).push(
                              //                       //     MaterialPageRoute(
                              //                       //         builder: (BuildContext
                              //                       //                 context) =>
                              //                       //             WorkorderEdit()));
                              //                     },
                              //                     icon: Icon(
                              //                       Icons.remove_circle,
                              //                       color: kPrimaryColor,
                              //                     ),
                              //                     label: const Text(
                              //                       'EDIT',
                              //                       style: TextStyle(
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           color: Colors.white),
                              //                     ),
                              //                     color: kPrimaryColor,
                              //                     shape: RoundedRectangleBorder(
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               10),
                              //                     ),
                              //                   ),
                              //                   FlatButton.icon(
                              //                     onPressed: () {
                              //                       // _woDisable(a, context);
                              //                       // // print(a);
                              //                     },
                              //                     icon: Icon(
                              //                       Icons.highlight_off,
                              //                       color: kPrimaryColor,
                              //                     ),
                              //                     label: const Text(
                              //                       'NOT ACTIVE',
                              //                       style: TextStyle(
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           color: Colors.white),
                              //                     ),
                              //                     color: kPrimaryColor,
                              //                     shape: RoundedRectangleBorder(
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               10),
                              //                     ),
                              //                   ),
                              //                   FlatButton.icon(
                              //                     onPressed: () {},
                              //                     icon: Icon(
                              //                       Icons.check_circle,
                              //                       color: kPrimaryColor,
                              //                     ),
                              //                     label: const Text(
                              //                       'ACTIVE',
                              //                       style: TextStyle(
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           color: Colors.white),
                              //                     ),
                              //                     color: kPrimaryColor,
                              //                     shape: RoundedRectangleBorder(
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               10),
                              //                     ),
                              //                   ),
                              //                   FlatButton.icon(
                              //                     onPressed: () {},
                              //                     icon: const Icon(Icons.delete,
                              //                         color: Colors.white),
                              //                     label: const Text(
                              //                       'DELETE',
                              //                       style: TextStyle(
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           color: Colors.white),
                              //                     ),
                              //                     color: kPrimaryColor,
                              //                     shape: RoundedRectangleBorder(
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               10),
                              //                     ),
                              //                   ),
                              //                   FlatButton.icon(
                              //                     onPressed: () {},
                              //                     icon: Icon(
                              //                       Icons.autorenew_sharp,
                              //                       color: kPrimaryColor,
                              //                     ),
                              //                     label: const Text(
                              //                       'RELOAD',
                              //                       style: TextStyle(
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           color: Colors.white),
                              //                     ),
                              //                     color: kPrimaryColor,
                              //                     shape: RoundedRectangleBorder(
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               10),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );
                            },
                            child: Card(
                              color: selectedIndex == index
                                  ? Colors.blue[100]
                                  : Colors.white,
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(
                                        0.5), // this column has a fixed width of 50
                                    1: FlexColumnWidth(
                                        0.1), // take 1/3 of the remaining space
                                    2: FlexColumnWidth(
                                        1), // // take 2/3 of the remaining space
                                  },
                                  children: [
                                    TableRow(children: [
                                      const Text('Fullname',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const Text(' : ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        user[index]['fullname'].toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Text('Username',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const Text(' : ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        user[index]['username'].toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      const Text('Email',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const Text(' : ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        user[index]['phone'].toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )),
            ),

            // SizedBox(height: 20),
            // HomeHeader(),
            // SizedBox(height: getProportionateScreenWidth(10)),
            // DiscountBanner(),
            // Categories(),
            // PopularProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
