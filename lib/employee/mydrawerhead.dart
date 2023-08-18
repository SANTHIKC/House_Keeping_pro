import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(

      color:   Color(0xcc5ac18e),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage:
            AssetImage('assetss/profilepic.jpg'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Hi Peter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,

            ),
          ),
          Text(
            'peter@gmail.com',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,

            ),
          ),
        ],
      ),
    );
  }
}
