import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';

class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({Key? key}) : super(key: key);

  @override
  State<EmployeeHomePage> createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  Future<dynamic> getdata() async {
    final url = "${AppConstants.url}singleemployeedataview.php";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emp_id = prefs.getString("id");
    print(emp_id);

    var response = await post(Uri.parse(url), body: {"emp_id": emp_id});
    if (response.statusCode == 200) {
      //print(response.body);
      var body = jsonDecode(response.body);
      return body;
    }
  }

  // Future<dynamic> getuserdata() async {
  //   final url = "${AppConstants.url}booking.php";
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? user_id = prefs.getString("id");
  //   print("hiii");
  //   print(user_id);
  //
  //   var response = await post(Uri.parse(url), body: {"user_id": user_id});
  //   print(response);
  //
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     var body = jsonDecode(response.body);
  //     return body;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ac18e),
      ),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Container(
                        color: const Color(0xcc5ac18e),
                        width: double.infinity,
                        height: 300,
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  "${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              snapshot.data["data"]["name"].toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              snapshot.data["data"]["email"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Text("somthing went wrong");
                    }
                  }),
              Column(
                children: [
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: const Icon(Icons.person),
                    title: const Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: const Icon(Icons.settings),
                    title: const Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: const Icon(Icons.share),
                    title: const Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: const Icon(Icons.notification_add),
                    title: const Text(
                      'Notification',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x665ac18e),
                              Color(0x995ac18e),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        "${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                                  ),
                                  const Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    snapshot.data["data"]["name"].toString(),
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    'Have a Nice day ',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Text("somthing went wrong");
                    }
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Working Schedules",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.7),
                    ))),
            const SizedBox(
              height: 22,
            ),
            // FutureBuilder(
            //     future: getuserdata(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       if (snapshot.hasData) {
            //         return Container(
            //           width: 150,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             border: Border.all(color: Colors.black),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Column(
            //             children: [
            //               const SizedBox(
            //                 height: 18,
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(8.0),
            //                 child: Row(
            //                   children: [
            //                     CircleAvatar(
            //                       radius: 25,
            //                       backgroundImage: NetworkImage(
            //                         "",
            //                         //"${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"
            //                       ),
            //                     ),
            //                     Column(
            //                       mainAxisAlignment: MainAxisAlignment.start,
            //                       children: [
            //                         Padding(
            //                           padding: EdgeInsets.only(left: 25),
            //                           child: Text(
            //                             //snapshot.data["data"]["user_id"].toString(),
            //                             "",
            //                             style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: 15,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           height: 8,
            //                         ),
            //                         Padding(
            //                           padding: EdgeInsets.only(left: 25),
            //                           child: Text(
            //                             //snapshot.data["data"]["name"].toString(),
            //                             "",
            //                             style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: 15,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(10),
            //                 child: Row(
            //                   children: [
            //                     Text(
            //                       //snapshot.data["data"]["service_type"].toString()
            //                       "",
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 15,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(10),
            //                 child: Row(
            //                   children: [
            //                     Text(
            //                       "",
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 15,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(10),
            //                 child: Row(
            //                   children: [
            //                     Text(
            //                       'address & Phone number',
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 15,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.all(10),
            //                     child: ElevatedButton(
            //                         style: ButtonStyle(
            //                             backgroundColor:
            //                                 MaterialStateProperty.all<Color>(
            //                                     const Color(0xff5ac18e)),
            //                             shape: MaterialStateProperty.all<
            //                                     RoundedRectangleBorder>(
            //                                 RoundedRectangleBorder(
            //                                     borderRadius:
            //                                         BorderRadius.circular(10))),
            //                             minimumSize:
            //                                 MaterialStateProperty.all<Size>(
            //                                     const Size(150, 60))),
            //                         onPressed: () {},
            //                         child: const Text(
            //                           "Accept",
            //                           style: TextStyle(color: Colors.black),
            //                         )),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(10),
            //                     child: ElevatedButton(
            //                         style: ButtonStyle(
            //                             backgroundColor:
            //                                 MaterialStateProperty.all<Color>(
            //                                     Colors.white60),
            //                             shape: MaterialStateProperty.all<
            //                                     RoundedRectangleBorder>(
            //                                 RoundedRectangleBorder(
            //                                     borderRadius:
            //                                         BorderRadius.circular(10))),
            //                             minimumSize:
            //                                 MaterialStateProperty.all<Size>(
            //                                     const Size(150, 60))),
            //                         onPressed: () {},
            //                         child: const Text(
            //                           "Reject",
            //                           style: TextStyle(color: Colors.black),
            //                         )),
            //                   )
            //                 ],
            //               )
            //             ],
            //           ),
            //         );
            //       } else {
            //         return Container(
            //           width: 150,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             border: Border.all(color: Colors.black),
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Column(
            //             children: [
            //               const SizedBox(
            //                 height: 18,
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(8.0),
            //                 child: Row(
            //                   children: [
            //                     CircleAvatar(
            //                       radius: 25,
            //                       backgroundImage: NetworkImage(
            //                         "image",
            //                         //"${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"
            //                       ),
            //                     ),
            //                     Column(
            //                       mainAxisAlignment: MainAxisAlignment.start,
            //                       children: [
            //                         Padding(
            //                           padding: EdgeInsets.only(left: 25),
            //                           child: Text(
            //                             //snapshot.data["data"]["user_id"].toString(),
            //                             "user_id",
            //                             style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: 15,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           height: 8,
            //                         ),
            //                         Padding(
            //                           padding: EdgeInsets.only(left: 25),
            //                           child: Text(
            //                             //snapshot.data["data"]["name"].toString(),
            //                             "name",
            //                             style: TextStyle(
            //                                 color: Colors.black,
            //                                 fontSize: 15,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(10),
            //                 child: Row(
            //                   children: [
            //                     Text(
            //                       //snapshot.data["data"]["service_type"].toString()
            //                       "servicetype",
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 15,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(10),
            //                 child: Row(
            //                   children: [
            //                     Text(
            //                       "date",
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 15,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.all(10),
            //                 child: Row(
            //                   children: [
            //                     Text(
            //                       'address & Phone number',
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontSize: 15,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.all(10),
            //                     child: ElevatedButton(
            //                         style: ButtonStyle(
            //                             backgroundColor:
            //                                 MaterialStateProperty.all<Color>(
            //                                     const Color(0xff5ac18e)),
            //                             shape: MaterialStateProperty.all<
            //                                     RoundedRectangleBorder>(
            //                                 RoundedRectangleBorder(
            //                                     borderRadius:
            //                                         BorderRadius.circular(10))),
            //                             minimumSize:
            //                                 MaterialStateProperty.all<Size>(
            //                                     const Size(150, 60))),
            //                         onPressed: () {},
            //                         child: const Text(
            //                           "Accept",
            //                           style: TextStyle(color: Colors.black),
            //                         )),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(10),
            //                     child: ElevatedButton(
            //                         style: ButtonStyle(
            //                             backgroundColor:
            //                                 MaterialStateProperty.all<Color>(
            //                                     Colors.white60),
            //                             shape: MaterialStateProperty.all<
            //                                     RoundedRectangleBorder>(
            //                                 RoundedRectangleBorder(
            //                                     borderRadius:
            //                                         BorderRadius.circular(10))),
            //                             minimumSize:
            //                                 MaterialStateProperty.all<Size>(
            //                                     const Size(150, 60))),
            //                         onPressed: () {},
            //                         child: const Text(
            //                           "Reject",
            //                           style: TextStyle(color: Colors.black),
            //                         )),
            //                   )
            //                 ],
            //               )
            //             ],
            //           ),
            //         );
            //         //return Text("somthing went wrong");
            //       }
            //     }),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
