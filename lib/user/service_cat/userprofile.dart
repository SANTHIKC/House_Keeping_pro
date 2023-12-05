import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appConstants/appConstants.dart';

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
      appBar: AppBar(),
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
                          snapshot.data["data"]["user_name"].toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          snapshot.data["data"]["email"].toString(),
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
          const ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
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

          const ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
