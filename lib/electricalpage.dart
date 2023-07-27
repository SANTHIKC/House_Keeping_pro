
import 'package:flutter/material.dart';

class Electricalpage extends StatefulWidget {
  const Electricalpage({Key? key}) : super(key: key);

  @override
  State<Electricalpage> createState() => _ElectricalpageState();
}

class _ElectricalpageState extends State<Electricalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: SafeArea(
       child: SingleChildScrollView(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 15,right: 15),
               child: Container(
                 width: 350,
                 height: 350,
                 decoration: BoxDecoration(shape: BoxShape.rectangle,
                   image: DecorationImage(image: AssetImage( "assetss/images/electricianmen2.jpg", ),fit: BoxFit.contain),
                 ),
               ),
             ),
             Text("Electrical  Services", style:TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.w800,
               color: Colors.black.withOpacity(0.7),
             )),
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
                           Text("Repair Service", style:TextStyle(
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
                           Text("Installation Service", style:TextStyle(
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
                           Text("Electrical Troubleshooting", style:TextStyle(
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
                           Text("Major Electrical Work", style:TextStyle(
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
                   height: 100,
                   child:
                     Padding(
                       padding: const EdgeInsets.all(10),
                       child: Text("Electricians work on electrical equipment and in homes, "
                           "factories, businesses, and buildings, both existing and under construction, "
                           "to install, repair, and maintain power, lighting, communications,"
                           " and control systems.", style:TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.w900,
                         color: Colors.black,
                       )),
                     ),


                 )),


           ],
         ),
       ),
     ),
    );
  }
}