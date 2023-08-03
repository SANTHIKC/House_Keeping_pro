import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<String>workname=['work details','pending work','approved work','completed work','cancelled work'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding:  EdgeInsets.all(10),
              child: Container(
                height: 269,
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
                    SizedBox(
                      height: 12,
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                            )
                          ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Padding(padding: EdgeInsets.only(left:15),
                child:Text("All Works Details", style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.7),
                ))),
            SizedBox(
              height: 15,
            ),
            Padding(padding: EdgeInsets.only(left:15),
                child:Text("Categories", style:TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.7),
                ))),

            SizedBox(
              height: 22,
            ),
            Container(
              height: 240,
              child: GridView.builder(
                shrinkWrap: true,

                itemCount: workname.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio:1.5 ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5, horizontal:15),
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            boxShadow: [BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                            ],

                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Center(
                            child: Text(workname[index],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.black.withOpacity(0.7),

                              ),
                            ),
                          ),
                        ) ,

                      ),
                      SizedBox(
                        height: 15,
                      ),

                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Padding(padding: EdgeInsets.only(left:15),
                child:Text("Working Hours", style:TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withOpacity(0.7),
                ))),
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: 5, horizontal:15),
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

          ),
          child:Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Text("Morning Time",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.black.withOpacity(0.7),

                    ),
                  ),
                ),
                Center(
                  child: Text("8.00 AM to 1.00 PM",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.black.withOpacity(0.7),

                    ),
                  ),
                ),
              ],
            ),
          ) ,

        ),
      ),
      SizedBox(
        height: 15,
      ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 5, horizontal:15),
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  boxShadow: [BoxShadow(
                    color: Colors.black38,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                  ],

                ),
                child:Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Text("Lunch Time",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(0.7),

                          ),
                        ),
                      ),
                      Center(
                        child: Text("1.00 AM to 2.00 PM",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(0.7),

                          ),
                        ),
                      ),
                    ],
                  ),
                ) ,

              ),
            ),

            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 5, horizontal:15),
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

                ),
                child:Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Text("Evening Time",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(0.7),

                          ),
                        ),
                      ),
                      Center(
                        child: Text("2.00 AM to 5.00 PM",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black.withOpacity(0.7),

                          ),
                        ),
                      ),
                    ],
                  ),
                ) ,

              ),
            ),
            SizedBox(
              height: 15,
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
