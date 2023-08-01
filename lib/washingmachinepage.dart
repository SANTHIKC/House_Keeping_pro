import 'package:flutter/material.dart';

class WashingMachinePage extends StatefulWidget {
  const WashingMachinePage({Key? key}) : super(key: key);

  @override
  State<WashingMachinePage> createState() => _WashingMachinePageState();
}

class _WashingMachinePageState extends State<WashingMachinePage> {
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
                decoration: BoxDecoration(shape: BoxShape.rectangle,
                  image: DecorationImage(image: AssetImage( "assetss/images/washingmachinerepair23.jpg", ),fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Washing Machine", style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.black.withOpacity(0.7),
              )),
            ),
            SizedBox(
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
                      color: Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Installaton Service", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
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
                      color: Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Noise Issue", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
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
                      color: Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Water not Drainig", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
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
                      color: Color.fromRGBO(255, 188, 0, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Icon(Icons.arrow_forward_ios_rounded,size: 30),),
                  ),
                  Padding(padding: EdgeInsets.only(left:18),
                      child:Row(
                        children: [
                          Text("Not Washing or Spinning", style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          )),

                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
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
            SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.only(left:18),
                child:Container(
                  height: 150,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("The working principle of a washing machine is "
                        "centrifugation. Centrifugation is a separation process "
                        "that uses the action of centrifugal force to promote "
                        "accelerated settling of particles in a solid-liquid mixture.",
                        style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )),
                  ),



                )),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 10),
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
                  child: Text(
                    "Book This Service",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

            ),
            SizedBox(
              height: 30,
            ),



          ],
        ),
      ),
    );
  }
}
