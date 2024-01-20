import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appConstants/appConstants.dart';
import '../../homescreen/loginhomepage.dart';
import '../booking/approvebooking.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 290,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assetss/background.webp'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.all(Radius.circular(110)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  "${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                snapshot.data["data"]["user_name"].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                snapshot.data["data"]["email"].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                snapshot.data["data"]["address"].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                snapshot.data["data"]["phone_number"]
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Text("somthing went wrong");
                }
              }),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 25, top: 25),
                child: GestureDetector(
                  onTap: () {
                    // Handle the tap event here, like navigating to a different screen.
                    // For example:
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return UserProfile(); // Replace with the screen you want to navigate to.
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
              //   child: GestureDetector(
              //     onTap: () {
              //       // Handle the tap event here, like navigating to a different screen.
              //       // For example:
              //       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //         return UserProfile(); // Replace with the screen you want to navigate to.
              //       }));
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.black12),
              //         borderRadius: BorderRadius.circular(8.0),
              //       ),
              //       child: ListTile(
              //         leading: Icon(Icons.settings),
              //         title: Text(
              //           'Settings',
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 20,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: GestureDetector(
                  onTap: () {
                    // Handle the tap event here, like navigating to a different screen.
                    // For example:
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ApprovebookingView(); // Replace with the screen you want to navigate to.
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      shape: Border.all(color: Colors.black12),
                      title: const Text(
                        'Status ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      leading: const Icon(Icons.task_rounded),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: GestureDetector(
                  onTap: () async {
                    SharedPreferences sharedpref =
                    await SharedPreferences.getInstance();
                    await sharedpref.clear();
                    // Handle the tap event here, like navigating to a different screen.
                    // For example:
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Signinhome(),
                        ),
                            (route) => false);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
