import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:house_keeping_pro/user/booking/approvebooking.dart';
import 'package:house_keeping_pro/user/service_cat/paintingpage.dart';
import 'package:house_keeping_pro/user/service_cat/plumbingpage.dart';
import 'package:house_keeping_pro/user/service_cat/refrigeratorpage.dart';
import 'package:house_keeping_pro/user/service_cat/userprofile.dart';
import 'package:house_keeping_pro/user/service_cat/washingmachinepage.dart';

import 'package:house_keeping_pro/user/service_cat/carpentrypage.dart';
import 'package:house_keeping_pro/user/service_cat/cleaningpage.dart';
import 'package:house_keeping_pro/user/service_cat/electricalpage.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';
import '../homescreen/loginhomepage.dart';
import 'booking/bookingsuccess.dart';

class HouseServicepage extends StatefulWidget {
  const HouseServicepage({Key? key}) : super(key: key);

  @override
  State<HouseServicepage> createState() => _HouseServicepageState();
}

class _HouseServicepageState extends State<HouseServicepage> {
  List<dynamic> services = [
    "Eletrical",
    "Cleaning",
    "Plumbing",
    "Carpentry",
    "Painting",
    "Washing Machine",
    "Refrigeator"
  ];
  List<String> serviceimage = [
    'assetss/eletrical.png',
    'assetss/clening1.png',
    'assetss/plumping1.png',
    'assetss/carpentry1.png',
    'assetss/paint1.png',
    'assetss/washingmachine.png',
    'assetss/refragetor.jpg',
  ];
  List<String> servicetype = [
    'assetss/images/electrician1.jpg',
    'assetss/images/cleaninglady2.jpg',
    'assetss/images/plumber2.jpg',
    'assetss/images/carpenter12.jpg',
    'assetss/images/painter2.jpg',
    'assetss/images/fridgerepair.jpg',
    'assetss/images/washingmachine.jpg'
  ];

  List<String> servicename = <String>[
    "Electrical Work",
    "Cleaning",
    "Plumbing Service",
    "Carpentry Work",
    "painting work",
    "Refrigerator Service",
    "Washingmachine Service",
  ];
  List<dynamic> pagename = [
    const Electricalpage(),
    const CleaningPage(),
    const PlumbingPage(),
    const CarpentryPage(),
    const PaintingPage(),
    const RefrigeratorPage(),
    const WashingMachinePage(),
  ];

  Future<dynamic> getuserdata() async {
    final url = "${AppConstants.url}singleuserdataview.php";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString("user_id");
    print(user_id);

    var response = await post(Uri.parse(url), body: {"user_id": user_id});
    if (response.statusCode == 200) {
      print(response.body);
      var body = jsonDecode(response.body);
      return body;
    }
  }

  int _currentIndex = 0;

  List<Widget> _screens = [
    const HouseServicepage(),
    const ApprovebookingView(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          "Home Shine",
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.white24,
      ),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Column(
          children: [
            FutureBuilder(
                future: getuserdata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Center(
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                                        fit: BoxFit.fill),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data["data"]["user_name"].toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data["data"]["email"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  } else {
                    return const Text("somthing went wrong");
                  }
                }),

            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Handle the tap event here, like navigating to a different screen.
                    // For example:
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const UserProfile(); // Replace with the screen you want to navigate to.
                    }));
                  },
                  child: Container(
                    child: const ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Handle the tap event here, like navigating to a different screen.
                //     // For example:
                //     Navigator.of(context)
                //         .push(MaterialPageRoute(builder: (context) {
                //       return UserProfile(); // Replace with the screen you want to navigate to.
                //     }));
                //   },
                //   child: Container(
                //
                //     child: ListTile(
                //       leading: Icon(Icons.settings),
                //       title: Text(
                //         'Settings',
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 20,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Handle the tap event here, like navigating to a different screen.
                    // For example:
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ApprovebookingView(); // Replace with the screen you want to navigate to.
                    }));
                  },
                  child: Container(
                    child: const ListTile(
                      leading: Icon(Icons.task_rounded),
                      title: Text(
                        'Status ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: () {
                    // Handle the tap event here, like navigating to a different screen.
                    // For example:
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Signinhome(); // Replace with the screen you want to navigate to.
                    }));
                  },
                  child: Container(
                      child: const ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  )),
                ),
              ],
            )
            // GestureDetector(
            //   onTap: () {
            //     // Handle the tap event here, like navigating to a different screen.
            //     // For example:
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //       return UserProfile(); // Replace with the screen you want to navigate to.
            //     }));
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black12),
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: ListTile(
            //       leading: Icon(Icons.person),
            //       title: Text(
            //         'Profile',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //
            // GestureDetector(
            //   onTap: () {
            //     // Handle the tap event here, like navigating to a different screen.
            //     // For example:
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //       return ApprovebookingView(); // Replace with the screen you want to navigate to.
            //     }));
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black12),
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: ListTile(
            //       shape: Border.all(color: Colors.black12),
            //       leading: const Icon(Icons.task_rounded),
            //       title: const Text(
            //         'Status ',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     // Handle the tap event here, like navigating to a different screen.
            //     // For example:
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //       return Signinhome(); // Replace with the screen you want to navigate to.
            //     }));
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black12),
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child:  ListTile(
            //       leading: Icon(Icons.logout),
            //       title: Text(
            //         'Logout',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //         ),
            //       ),
            //     )
            //   ),
            // ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: FutureBuilder(
                    future: getuserdata(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasData) {
                        return Container(
                          height: 170,
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
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                                    ),
                                    // const Icon(
                                    //   Icons.notifications_outlined,
                                    //   color: Colors.black,
                                    //   size: 35,
                                    // ),
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
                                      snapshot.data["data"]["user_name"]
                                          .toString(),
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
                                      'What Service do you need?',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "All Services",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                            image: DecorationImage(
                                image: AssetImage(serviceimage[index]),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              services[index],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Popular Services",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.black.withOpacity(0.7),
                      ))),
              const SizedBox(
                height: 22,
              ),
              Container(
                height: 240,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: servicename.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'selectedServiceName', servicename[index]);

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return pagename[index];
                              },
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            height: 150,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black12),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage(servicetype[index]),
                                    fit: BoxFit.fill),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              servicename[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Happiness Guarantee",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.black.withOpacity(0.7),
                      ))),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 188, 0, 100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.access_time_outlined, size: 30),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text("Fast Service",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 188, 0, 100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.chat_bubble_outline, size: 30),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text("Live Support",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 188, 0, 100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.monetization_on_outlined, size: 30),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text("Predefined Pricing",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 188, 0, 100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.verified_user_outlined, size: 30),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text("Verified Professionals",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _screens[index]),
            );
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Booking',
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
