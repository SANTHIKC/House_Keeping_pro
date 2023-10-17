import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:house_keeping_pro/paintingpage.dart';
import 'package:house_keeping_pro/plumbingpage.dart';
import 'package:house_keeping_pro/refrigeratorpage.dart';
import 'package:house_keeping_pro/washingmachinepage.dart';

import 'package:house_keeping_pro/carpentrypage.dart';
import 'package:house_keeping_pro/cleaningpage.dart';
import 'package:house_keeping_pro/electricalpage.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appConstants/appConstants.dart';


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
  List<String> serviceimage = ['assetss/eletrical.png', 'assetss/clening1.png','assetss/plumping1.png',
    'assetss/carpentry1.png','assetss/paint1.png', 'assetss/washingmachine.png','assetss/refragetor.jpg',

  ];
  List<String>servicetype=['assetss/images/electrician1.jpg',
  'assetss/images/cleaninglady2.jpg','assetss/images/plumber2.jpg',
  'assetss/images/carpenter12.jpg','assetss/images/painter2.jpg','assetss/images/fridgerepair.jpg',
  'assetss/images/washingmachine.jpg'];

  List<String> servicename = [
    " Electrical Work",
    " Cleaning ",
    "Plumbing Service",
    " Carpentry Work",
    "painting work",
    "Refrigerator Service",
    "Washingmachine Service",

  ];
  List<dynamic>pagename=[
  Electricalpage(),
  CleaningPage(),
  PlumbingPage(),
  CarpentryPage(),
  PaintingPage(),
  RefrigeratorPage(),
  WashingMachinePage(),];



  Future<dynamic> getuserdata() async {
    final url = "${AppConstants.url}singleuserdataview.php";

    SharedPreferences prefs =await SharedPreferences.getInstance();
    String? user_id = prefs.getString("id");

    var response = await post(Uri.parse(url),body: {"user_id":user_id});
    if (response.statusCode == 200) {
      print(response.body);
      var body = jsonDecode(response.body);
      return body;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff5ac18e),
      ),

      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Column(
          children: [
            FutureBuilder(
              future: getuserdata(),
              builder: (context ,snapshot) {
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
                          snapshot.data["data"]["user_name"].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                  
                          ),
                        ),
                        Text(
                          snapshot.data["data"]["email"].toString(),
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
            ListTile(
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
      ),

      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.all(10),
                  child: FutureBuilder(
                    future: getuserdata(),
                    builder: (context,snapshot) {
                      if(snapshot.connectionState==ConnectionState.waiting)
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }

                      if (snapshot.hasData)
                      {
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
                                      radius: 30,
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
                                      snapshot.data["data"]["user_name"].toString(),
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

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "All Services",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(
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
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black12),
                                boxShadow: [BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              image: DecorationImage(image: AssetImage(serviceimage[index]),fit: BoxFit.fill),
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(services[index],
                                style: TextStyle(
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

                Padding(padding: EdgeInsets.only(left:15),
                child:Text("Popular Services", style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.7),
                ))),
                SizedBox(
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
                            onTap:(
                                )
                            async{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString('selectedServiceName', servicename[index]);

                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return pagename[index];
                              },));
                            },

                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal:15),
                              height: 150,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black12),
                                boxShadow: [BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                                ],
                                image: DecorationImage(image: AssetImage(servicetype[index]),fit: BoxFit.fill),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),

                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(servicename[index],
                                style: TextStyle(
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
                SizedBox(
                  height: 15,
                ),

                Padding(padding: EdgeInsets.only(left:15),
                    child:Text("Happiness Guarantee", style:TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.7),
                    ))),
                SizedBox(
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
                          color: Color.fromRGBO(255, 188, 0, 100),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Icon(Icons.access_time_outlined,size: 30),),
                      ),
                      Padding(padding: EdgeInsets.only(left:18),
                          child:Text("Fast Service", style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.7),
                          ))),
                    ],
                  ),
                ),
                SizedBox(
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
                          color: Color.fromRGBO(255, 188, 0, 100),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Icon(Icons.chat_bubble_outline,size: 30),),
                      ),
                      Padding(padding: EdgeInsets.only(left:18),
                          child:Text("Live Support", style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.7),
                          ))),
                    ],
                  ),
                ),
                SizedBox(
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
                          color: Color.fromRGBO(255, 188, 0, 100),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Icon(Icons.monetization_on_outlined,size: 30),),
                      ),
                      Padding(padding: EdgeInsets.only(left:18),
                          child:Text("Predefined Pricing", style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.7),
                          ))),
                    ],
                  ),
                ),
                SizedBox(
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
                          color: Color.fromRGBO(255, 188, 0, 100),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Icon(Icons.verified_user_outlined,size: 30),),
                      ),
                      Padding(padding: EdgeInsets.only(left:18),
                          child:Text("Verified Professionals", style:TextStyle(
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.library_books),
            label: 'Booking',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}


