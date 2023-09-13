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

      SharedPreferences prefs =await SharedPreferences.getInstance();
      String? emp_id = prefs.getString("id");

    var response = await post(Uri.parse(url),body: {"emp_id":emp_id});
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
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              FutureBuilder(
                future: getdata(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (snapshot.hasData) {
                    return Container(
                      color:   Color(0xcc5ac18e),
                      width: double.infinity,
                      height: 300,
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                            NetworkImage("${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            snapshot.data["data"]["name"].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,

                            ),
                          ),
                          Text(
                            snapshot.data["data"]["email"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,

                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  else
                    {
                      return Text("somthing went wrong");
                    }
                }
              ),
              Column(
                children: [
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: Icon(Icons.person),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,

                      ),
                    ),
                  ),
                  ListTile(
                    shape: Border.all(color: Colors.black12),
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
                    leading: Icon(Icons.share),
                    title: Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,

                      ),
                    ),
                  ),
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: Icon(Icons.notification_add),
                    title: Text(
                      'Notification',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,

                      ),
                    ),
                  ),
                  ListTile(
                    shape: Border.all(color: Colors.black12),
                    leading: Icon(Icons.logout),
                    title: Text(
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
              padding:  EdgeInsets.all(10),
              child: FutureBuilder(
                future: getdata(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (snapshot.hasData) {
                    return Container(
                      height: 230,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                  NetworkImage("${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                                ),
                                Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: 15),
                                child: Text(
                                  snapshot.data["data"]["name"].toString(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 15),
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
                  }
                  else
                    {
                      return Text("somthing went wrong");
                    }
                }
              ),
            ),
            SizedBox(
              height: 15,
            ),


            SizedBox(
              height: 15,
            ),
            Padding(padding: EdgeInsets.only(left:15),
                child:Text("Working Schedules", style:TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.7),
                ))),

            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),

                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Row(

                        children: [

                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                            AssetImage('assetss/profilepic.jpg'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Name',style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                              SizedBox(
                                height: 8,
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text( 'Electrician',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text( 'RS:350 /-',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text( 'date and time',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text( 'address & Phone number',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Color(0xff5ac18e)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  minimumSize:
                                  MaterialStateProperty.all<Size>(Size(150, 60))),
                              onPressed: () {

                          }, child: Text("Accept",style: TextStyle(color: Colors.black),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white60),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  minimumSize:
                                  MaterialStateProperty.all<Size>(Size(150, 60))),
                              onPressed: () {

                              }, child: Text("Reject",style: TextStyle(color: Colors.black),)),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),






          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),

    );
  }

}
