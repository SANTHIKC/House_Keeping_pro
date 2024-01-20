import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';
import 'employeehomepage.dart';

class EmployeeOldWorks extends StatefulWidget {
  const EmployeeOldWorks({super.key});

  @override
  State<EmployeeOldWorks> createState() => _EmployeeOldWorksState();
}

class _EmployeeOldWorksState extends State<EmployeeOldWorks> {
  Future<dynamic> getuserdata() async {
    final url = "${AppConstants.url}employeebookingstatusview.php";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emp_id = prefs.getString("employee_id");

    var response = await post(Uri.parse(url), body: {"emp_id": emp_id});

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
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(" User Status",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.7),
                    )),
              ),
              const SizedBox(
                height: 10,
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
                                                        "name  :",
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
                                                                ["user_name"]
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
                                                        "Address  :",
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
                                                                ["address"]
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
                                                        "phonenumber  :",
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
                                                                ["phone_number"]
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
                      } else {
                        return const Text("No data Entered");
                      }
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 65,
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const EmployeeHomePage();
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
