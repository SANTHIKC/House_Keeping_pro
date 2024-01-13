import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:house_keeping_pro/employee/employeeoldworks.dart';
import 'package:house_keeping_pro/employee/profile.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';
import '../homescreen/loginhomepage.dart';
import 'approveduserstatus.dart';
import 'employeregistration.dart';

class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({Key? key}) : super(key: key);

  @override
  State<EmployeeHomePage> createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
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

  Future<dynamic> getuserdata() async {
    final url1 = "${AppConstants.url}employeebookingview.php";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString("id");
    String? emp_type = prefs.getString("emp_type");
    print("hiii");
    print(emp_type);

    var response = await post(Uri.parse(url1), body: {"service_type": emp_type},);
    print(response);
    var body;
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      body = jsonDecode(response.body);
      print(body.runtimeType);

    }
    return body;
  }


  Future<void> approvebooking(bookingid) async {
    final url = "${AppConstants.url}approvebooking.php";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emp_id = prefs.getString("employee_id");
    print(emp_id);


    final response = await post(Uri.parse(url),body:{"booking_id":bookingid,"emp_id": emp_id });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('approvedbooking');

      return data;
    }
  }



  int _currentIndex = 0;


  List<Widget> _screens = [
    EmployeeHomePage(),
    ApproverUserStatus(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Home Shine",
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal,fontSize: 30,),
        ),
        backgroundColor: Colors.white24,

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
                  GestureDetector(
                    onTap: () {
                      // Handle the tap event here, like navigating to a different screen.
                      // For example:
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
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
                        return EmployeeOldWorks(); // Replace with the screen you want to navigate to.
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
                          'completed work ',
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
                        return Signinhome(); // Replace with the screen you want to navigate to.
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
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [

            Padding(
              padding:  EdgeInsets.all(10),
              child: FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
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
                              padding:  EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
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
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    snapshot.data["data"]["email"].toString(),
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),



                          ],
                        ),
                      );
                    } else {
                      return  Text("No data here");
                    }
                  }),
            ),
             SizedBox(
              height: 15,
            ),
             SizedBox(
              height: 15,
            ),
            Padding(
                padding:  EdgeInsets.only(left: 15),
                child: Text("Working Schedules",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.7),
                    ))),
             SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: FutureBuilder(
                  future:getuserdata() ,
                  builder: (context,AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData && snapshot.data.length!=0) {
                      return SizedBox(height: MediaQuery.sizeOf(context).height/1.5,
                        child: ListView.builder(
                          itemCount:snapshot.data["data"].length,
                          itemBuilder: (context,index) {



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
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(left: 25),
                                                    child: Text(
                                                      "booking_id  :",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left: 15),
                                                    child: Text(snapshot.data["data"][index]["booking_id"].toString(),

                                                      style:  TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 25),
                                                    child: Text(
                                                      "name  :",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left: 15),
                                                    child: Text(snapshot.data["data"][index]["user_name"].toString(),

                                                      style:  TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 25),
                                                    child: Text(
                                                      "date  :",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left: 15),
                                                    child: Text(snapshot.data["data"][index]["date"].toString(),

                                                      style:  TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 25),
                                                    child: Text(
                                                      "address  :",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left: 15),
                                                    child: Text(
                                                      snapshot.data["data"][index]["address"].toString(),
                                                      style:  TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),




                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.all(5),
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Color(0xff5ac18e)),
                                                      shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(10))),
                                                      minimumSize:
                                                      MaterialStateProperty.all<Size>(
                                                          Size(150, 60))),
                                                  onPressed: () {
                                                    approvebooking(snapshot.data["data"][index]["booking_id"].toString());
                                                    setState(() {

                                                    });
                                                  },
                                                  child:  Text(
                                                    "Accept",
                                                    style: TextStyle(color: Colors.black),
                                                  )),
                                            ),
                                            // Padding(
                                            //   padding:  EdgeInsets.all(10),
                                            //   child: ElevatedButton(
                                            //       style: ButtonStyle(
                                            //           backgroundColor:
                                            //               MaterialStateProperty.all<Color>(
                                            //                   Colors.white60),
                                            //           shape: MaterialStateProperty.all<
                                            //                   RoundedRectangleBorder>(
                                            //               RoundedRectangleBorder(
                                            //                   borderRadius:
                                            //                       BorderRadius.circular(10))),
                                            //           minimumSize:
                                            //               MaterialStateProperty.all<Size>(
                                            //                    Size(150, 60))),
                                            //       onPressed: () {},
                                            //       child:  Text(
                                            //         "Reject",
                                            //         style: TextStyle(color: Colors.black),
                                            //       )),
                                            // )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );

                          }
                        ),
                      );
                    }if(snapshot.hasError){
                      return const Text("Snapshot error");
                    } else {

                      return const Center(child: Text("No work data available"));
                    }
                  }),
            ),
             SizedBox(
              height: 30,
            ),
          ],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
