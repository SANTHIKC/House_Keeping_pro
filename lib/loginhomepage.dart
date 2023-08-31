import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'alertloginpage.dart';
import 'houseservicepage.dart';

class Signinhome extends StatefulWidget {
  const Signinhome({Key? key}) : super(key: key);

  @override
  State<Signinhome> createState() => _SigninhomeState();
}

class _SigninhomeState extends State<Signinhome> {
  TextEditingController usernametextcontroller = TextEditingController();
  TextEditingController passwordtextcontroller = TextEditingController();





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
                        "house keeping Services"
                        ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
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
                                MaterialStateProperty.all<Color>( Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(330, 60))),
                        onPressed: () {},
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return HouseServicepage();
                            },));
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
                         Text('Do you have an Account ?', style: TextStyle(
                             color: Colors.white,
                             fontSize: 15,
                             fontWeight: FontWeight.bold),),
                         InkWell(onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                         return Alertloginpage();
                           },));
                         showDialog(context: context, builder: (BuildContext context) {
                           return AlertDialog(
                             title: Text("messege"),
                             content: Text(" Do you want to register as a User or Employee "),
                           );

                         },);
                         },
                           child: Text( 'Register Now',
                             style: TextStyle(
                                 color: Colors.black38,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold),),
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



