import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'package:house_keeping_pro/homescreen/alertloginpage.dart';
import 'package:house_keeping_pro/appConstants/appConstants.dart';
import 'package:house_keeping_pro/employee/employeehomepage.dart';
import 'package:house_keeping_pro/user/houseservicepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signinhome extends StatefulWidget {
  const Signinhome({Key? key}) : super(key: key);

  @override
  State<Signinhome> createState() => _SigninhomeState();
}

class _SigninhomeState extends State<Signinhome> {
  TextEditingController usernametextcontroller = TextEditingController();
  TextEditingController passwordtextcontroller = TextEditingController();

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  postUserData() async {
    var url = Uri.parse("${AppConstants.url}useremplog.php");
    var body = {
      "email": usernametextcontroller.text,
      "password": passwordtextcontroller.text,
    };

    var response = await post(url, body: body);

    if (response.statusCode == 200) {
      print("Response body: ${response.body}");
      var userdata = jsonDecode(response.body);
      print(userdata["data"]);

      if (userdata["data"] == "successful" &&
          userdata["message"]["type"] == "user") {
        dynamic currentUser = userdata;
        print('Current User : $currentUser');
        SharedPreferences sharedpref = await SharedPreferences.getInstance();

        String log_id = userdata["message"]["log_id"];

        sharedpref.setString("user_id", log_id);
        print('userid=$log_id');

        print("userdata added");

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return const HouseServicepage();
          },
        ));
      }
      if (userdata["data"] == "successful" &&
          userdata["message"]["type"] == "employee") {
        SharedPreferences sharedpref = await SharedPreferences.getInstance();
        String log_id = userdata["message"]["log_id"];
        sharedpref.setString("employee_id", log_id);

        print("employeedata added");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return const EmployeeHomePage();
          },
        ));
      } else {
        print("somthing wrong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "HomeShine",
                style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    image: const DecorationImage(
                        image: AssetImage('assetss/homeshine.jpg'),
                        fit: BoxFit.fill),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "Email",
                  style: TextStyle(
                      color: Color(0x995ac18e),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
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
                    style: const TextStyle(color: Colors.black87),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: Color(0xff5ac18e),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "Password",
                  style: TextStyle(
                      color: Color(0x995ac18e),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
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
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff5ac18e),
                      ),
                      hintText: "Password",
                      helperStyle: TextStyle(
                        color: Colors.black38,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0x665ac18e),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(330, 60))),
                onPressed: () {
                  postUserData();
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Do you have an Account ?',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const Alertloginpage();
                        },
                      ));
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.black87,
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
    );
  }
}
