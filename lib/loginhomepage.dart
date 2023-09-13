import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'package:house_keeping_pro/alertloginpage.dart';
import 'package:house_keeping_pro/appConstants/appConstants.dart';
import 'package:house_keeping_pro/employee/employeehomepage.dart';
import 'package:house_keeping_pro/houseservicepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signinhome extends StatefulWidget {
  const Signinhome({Key? key}) : super(key: key);

  @override
  State<Signinhome> createState() => _SigninhomeState();
}

class _SigninhomeState extends State<Signinhome> {
  TextEditingController usernametextcontroller = TextEditingController();
  TextEditingController passwordtextcontroller = TextEditingController();


  postUserData() async {

    var url = Uri.parse("${AppConstants.url}useremplog.php");
    var body = {
      "email": usernametextcontroller.text,
      "password": passwordtextcontroller.text,
    };



    var response = await post(url, body:body);

    if (response.statusCode == 200) {
      print("Response body: ${response.body}");
      var userdata = jsonDecode(response.body);
      print(userdata["data"]);





      if (userdata["data"] == "successful" && userdata["message"]["type"] == "user") {
        SharedPreferences sharedpref =await SharedPreferences.getInstance();
        String log_id= userdata["message"]["log_id"];
        sharedpref.setString("id",log_id);

        print("employeedata added");

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return HouseServicepage();
          },
        ));
      }
        if(userdata["data"] == "successful" && userdata["message"]["type"] == "employee")
          {
            SharedPreferences sharedpref =await SharedPreferences.getInstance();
            String log_id= userdata["message"]["log_id"];
            sharedpref.setString("id",log_id);

            print("userdata added");
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return EmployeeHomePage();
              },
            ));
          }

      else
        {
          print("somthing wrong");
        }

    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ])),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HomeShine",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            image: DecorationImage(
                                image: AssetImage('assetss/homeshine.jpg'),
                                fit: BoxFit.fill),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 60,
                              child: TextField(
                                controller: usernametextcontroller,
                                style: TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: Color(0xff5ac18e),
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 60,
                              child: TextField(
                                controller: passwordtextcontroller,
                                style: TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xff5ac18e),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(330, 60))),
                        onPressed: () {},
                        child: InkWell(
                          onTap: () {
                            postUserData();

                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Color(0xff5ac18e),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Do you have an Account ?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return Alertloginpage();
                                },
                              ));
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("messege"),
                                    content: Text(
                                        " Do you want to register as a User or Employee "),
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
