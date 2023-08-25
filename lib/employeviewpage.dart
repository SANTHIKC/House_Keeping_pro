import 'package:flutter/material.dart';

class EmployeeViewpage extends StatelessWidget {
  String name,email,password,address,phonenumber,experience,servicetype;

  EmployeeViewpage(
      {required this.name,
        required this.email,
        required this.password,
        required this.address,
        required this.phonenumber,
        required this.experience,
        required this.servicetype});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(name),
                Text(email),
                Text(password),
                Text(address),
                Text(phonenumber),
                Text(experience),
                Text(servicetype),


                
              ],),
          ),
        ),
      ),
    );
  }
}

