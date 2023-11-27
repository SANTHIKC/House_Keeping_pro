import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';

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
    );
  }
}
