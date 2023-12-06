import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';
import 'approveduserstatus.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<dynamic> getdata() async {
    final url = "${AppConstants.url}singleemployeedataview.php";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emp_id = prefs.getString("employee_id");
    print(emp_id);

    var response = await post(Uri.parse(url), body: {"emp_id": emp_id});
    if (response.statusCode == 200) {
      //print(response.body);
      var body = jsonDecode(response.body);
      prefs.setString("emp_type", body["data"]["service_type"]);
      return body;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
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
                    height: 400,
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: CircleAvatar(
                                radius:70,
                                backgroundImage: NetworkImage(
                                    "${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data["data"]["name"].toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data["data"]["email"].toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data["data"]["address"].toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data["data"]["phone_number"].toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
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
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle the tap event here, like navigating to a different screen.
                  // For example:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Profile(); // Replace with the screen you want to navigate to.
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
              GestureDetector(
                onTap: () {
                  // Handle the tap event here, like navigating to a different screen.
                  // For example:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return Profile(); // Replace with the screen you want to navigate to.
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle the tap event here, like navigating to a different screen.
                  // For example:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ApproverUserStatus(); // Replace with the screen you want to navigate to.
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: const Icon(Icons.task_rounded),
                    title: const Text(
                      'Status ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle the tap event here, like navigating to a different screen.
                  // For example:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ApproverUserStatus(); // Replace with the screen you want to navigate to.
                  }));
                },
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:  ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
