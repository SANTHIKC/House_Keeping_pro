import 'package:flutter/material.dart';



class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({Key? key}) : super(key: key);

  @override
  State<EmployeeHomePage> createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Text(''),
      ),


      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding:  EdgeInsets.all(10),
              child: Container(
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
                            AssetImage('assetss/profilepic.jpg'),
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
                            'Hi Peter',
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
