import 'package:flutter/material.dart';

import 'electricalpage.dart';

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
  List<String>servicetype=['assetss/images/electrician_men.jpg',
  'assetss/images/cleaninglady2.jpg','assetss/images/plumbingmen1.jpg',
  'assetss/images/carpenterman1.jpg','assetss/images/painter13.jpg','assetss/images/fridgerepair.jpg',
  'assetss/images/washingmachingrepair1.jpg'];

  List<String> servicename = [
    "Major Electrical Work",
    "Daily Cleaning",
    "Repair Service",
    "New Furniture Making",
    "painting work",
    "Refrigerator Repair",
    "Installation Service",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                ){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return Electricalpage();
                              },));
                            },

                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal:15),
                              height: 180,
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
                          child:Text("Happiness Guarantee", style:TextStyle(
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
