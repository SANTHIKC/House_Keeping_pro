import 'package:flutter/material.dart';
import 'package:house_keeping_pro/userregistration.dart';

import 'employeregistration.dart';

class Alertloginpage extends StatefulWidget {
  const Alertloginpage({Key? key}) : super(key: key);

  @override
  State<Alertloginpage> createState() => _AlertloginpageState();
}

class _AlertloginpageState extends State<Alertloginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height:400 ,
                child: Image(image: AssetImage('assetss/home2.jpg',)),
              ),


               Container(
                 height: 100,
                   child: ElevatedButton(
                     style: ButtonStyle(
                         backgroundColor:
                         MaterialStateProperty.all<Color>(  Color(0x665ac18e),),
                         shape: MaterialStateProperty.all<
                             RoundedRectangleBorder>(
                             RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(15))),
                         minimumSize:
                         MaterialStateProperty.all<Size>(Size(330, 60))),
                     onPressed: () {},
                     child: InkWell(
                       onTap: () {
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                           return UserRegistration();
                         },));
                       },

                       child: Text(
                         "USER",
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 18,
                             fontWeight: FontWeight.bold),
                       ),
                     ),
                   ),

               ),

              SizedBox(
                height: 40,
              ),
              Container(
                height: 100,
                child:ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(  Color(0x665ac18e),),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      minimumSize:
                      MaterialStateProperty.all<Size>(Size(330, 60))),
                  onPressed: () {},
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return EmployeeRegistration();
                      },));
                    },

                    child: Text(
                      "EMPLOYEE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
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
