import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../booking/bookingdateandtime.dart';

class PaintingPage extends StatefulWidget {
  const PaintingPage({Key? key}) : super(key: key);

  @override
  State<PaintingPage> createState() => _PaintingPageState();
}

class _PaintingPageState extends State<PaintingPage> {
  // List<String>painting=[
  //   'Whitewash',
  //   'Enamel Painting',
  //   'Synthetic Rubber Painting',
  //   'Cement Painting',
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
                  image: DecorationImage(image: AssetImage( "assetss/images/painter.jpg", ),fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Painting Services", style:TextStyle(
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
                          Text("Whitewash", style:TextStyle(
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
                          Text("Enamel Painting", style:TextStyle(
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
                          Text("Synthetic Rubber Painting", style:TextStyle(
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
                          Text("Cement Painting", style:TextStyle(
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
                    child: Text("A Painter is a professional who helps prepare surfaces,"
                        " mix paints for different needs, and apply them with brushes or"
                        " rollers to fill in cracks or apply color on walls and other "
                        "objects around a home, such as furniture pieces or doors..",
                        style:TextStyle(
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
                    // prefs.setStringList('selectedServiceList',painting);

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
