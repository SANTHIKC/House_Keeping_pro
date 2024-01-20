import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';
import '../homescreen/loginhomepage.dart';
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
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(elevation: 0,
        //
        //   backgroundColor: Colors.white24,),
        body: Column(
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
                                  snapshot.data["data"]["name"].toString(),
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
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                //   child: GestureDetector(
                //     onTap: () {
                //       // Handle the tap event here, like navigating to a different screen.
                //       // For example:
                //       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //         return Profile(); // Replace with the screen you want to navigate to.
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
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: GestureDetector(
                    onTap: () {
                      // Handle the tap event here, like navigating to a different screen.
                      // For example:
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 25),
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
      ),
    );
  }
}
