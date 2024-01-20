import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appConstants/appConstants.dart';
import '../houseservicepage.dart';

class ApprovebookingView extends StatefulWidget {
  const ApprovebookingView({super.key});

  @override
  State<ApprovebookingView> createState() => _ApprovebookingViewState();
}

class _ApprovebookingViewState extends State<ApprovebookingView> {
  Future<dynamic> getuserdata() async {
    final url = "${AppConstants.url}userbookingstatusview.php";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString("user_id");

    var response = await post(Uri.parse(url), body: {"user_id": user_id});

    if (response.statusCode == 200) {
      // print(response.body);
      var body = jsonDecode(response.body);

      return body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("  Status View",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black.withOpacity(0.7),
                      ))),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: FutureBuilder(
                    future: getuserdata(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData && snapshot.data.length != 0) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height / 1.5,
                          child: ListView.builder(
                              itemCount: snapshot.data["data"].length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 18,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 25),
                                                      child: Text(
                                                        "booking_id  :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 15),
                                                      child: Text(
                                                        snapshot.data["data"]
                                                                [index]
                                                                ["booking_id"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 25),
                                                      child: Text(
                                                        "emp_id  :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 15),
                                                      child: Text(
                                                        snapshot.data["data"]
                                                                [index]
                                                                ["emp_id"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 25),
                                                      child: Text(
                                                        "date  :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 15),
                                                      child: Text(
                                                        snapshot.data["data"]
                                                                [index]["date"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      "Servicetype : ",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 210,
                                                      child: Text(
                                                        snapshot.data["data"]
                                                                [index]
                                                                ["service_type"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 25),
                                                      child: Text(
                                                        "Status  :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 15),
                                                      child: Text(
                                                        snapshot.data["data"]
                                                                [index]
                                                                ["status"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Text("Snapshot error");
                      } else {
                        return const Center(
                            child: Text("No work data available"));
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  width: 250,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff5ac18e)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const HouseServicepage();
                          },
                        ));
                      },
                      child: const Text(
                        "back to home page",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
