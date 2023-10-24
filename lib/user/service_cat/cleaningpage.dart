import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../booking/bookingdateandtime.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({Key? key}) : super(key: key);

  @override
  State<CleaningPage> createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  // List<String>cleaning=[
  //   'Commercial cleaning',
  //   'Window cleaner',
  //   'Upholstery cleaning',
  //   'Floor cleaning',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection:Axis.vertical ,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
                width: 350,
                height: 350,
                decoration: const BoxDecoration(shape: BoxShape.rectangle,
                  image: DecorationImage(image: AssetImage( "assetss/images/cleninglady1.jpg", ),fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Cleaning  Services", style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.black.withOpacity(0.7),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  const Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Commercial cleaning", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  const Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Window cleaner", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  const Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Upholstery cleaning", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  const Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Floor cleaning", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [

                  Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Description", style:TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          )),
                          SizedBox(
                            height: 20,
                          ),

                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(padding: const EdgeInsets.only(left:18),
                child:Container(
                  height: 150,
                  child:
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Cleaning, stocking and supplying designated facility "
                        "areas (dusting, sweeping, vacuuming, mopping, cleaning ceiling "
                        "vents, restroom cleaning etc) Performing and documenting routine "
                        "inspection and maintenance activities. Carry out heavy cleaning "
                        "tasks and special projects.", style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )),
                  ),



                )),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 10),
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
                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    // prefs.setStringList('selectedServiceList',cleaning );


                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const BookingDateandTime();
                    },));
                  },
                  child: const Text(
                    "Book This Service",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

            ),
            const SizedBox(
              height: 30,
            ),



          ],
        ),
      ),

    );
  }
}
