import 'package:flutter/material.dart';
import 'package:house_keeping_pro/user/service_cat/userregistration.dart';

import '../employee/employeregistration.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height:300 ,
                  child: const Image(image: AssetImage('assetss/house1.jpg',)),
                ),
              ),


               Container(
                 height: 100,
                   child: ElevatedButton(
                     style: ButtonStyle(
                         backgroundColor:
                         MaterialStateProperty.all<Color>(  const Color(0x665ac18e),),
                         shape: MaterialStateProperty.all<
                             RoundedRectangleBorder>(
                             RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(15))),
                         minimumSize:
                         MaterialStateProperty.all<Size>(const Size(330, 60))),
                     onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                         return const UserRegistration();
                       },));
                     },
                     child: const Text(
                       "USER",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                           fontWeight: FontWeight.bold),
                     ),
                   ),

               ),

              const SizedBox(
                height: 40,
              ),
              Container(
                height: 100,
                child:ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(  const Color(0x665ac18e),),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      minimumSize:
                      MaterialStateProperty.all<Size>(const Size(330, 60))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const EmployeeRegistration();
                    },));
                  },
                  child: const Text(
                    "EMPLOYEE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
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
