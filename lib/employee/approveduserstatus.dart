import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appConstants/appConstants.dart';

class ApproverUserStatus extends StatefulWidget {
  const ApproverUserStatus({super.key});

  @override
  State<ApproverUserStatus> createState() => _ApproverUserStatusState();
}

class _ApproverUserStatusState extends State<ApproverUserStatus> {

  Future<dynamic> getuserdata() async {
    final url1 = "${AppConstants.url}employeebookingview.php";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString("id");
    String? emp_type = prefs.getString("emp_type");
    print("hiii");
    print(emp_type);

    var response = await post(Uri.parse(url1), body: {"service_type": emp_type},);
    print(response);
    var body;
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      body = jsonDecode(response.body);
      print(body.runtimeType);

    }
    return body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding:  EdgeInsets.only(left: 15),
                child: Text("Approved User",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.7),
                    ))),
            SizedBox(
              height: 22,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(5),
            //   child: FutureBuilder(
            //       future:getuserdata() ,
            //       builder: (context,AsyncSnapshot<dynamic> snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return  Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         }
            //         if (snapshot.hasData) {
            //
            //           return SizedBox(height: MediaQuery.sizeOf(context).height/1.5,
            //             child: ListView.builder(
            //                 itemCount:snapshot.data["data"].length,
            //                 itemBuilder: (context,index) {
            //
            //
            //                   return Padding(
            //                     padding: const EdgeInsets.all(10),
            //                     child: Container(
            //                       width: 130,
            //                       decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         border: Border.all(color: Colors.black),
            //                         borderRadius: BorderRadius.circular(10),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(10),
            //                         child: Column(
            //                           children: [
            //                             SizedBox(
            //                               height: 18,
            //                             ),
            //                             Padding(
            //                               padding: EdgeInsets.all(8.0),
            //                               child: Column(
            //                                 children: [
            //
            //                                   Row(
            //                                     mainAxisAlignment: MainAxisAlignment.start,
            //                                     children: [
            //                                       Padding(
            //                                         padding: EdgeInsets.only(left: 25),
            //                                         child: Text(
            //                                           "booking_id  :",
            //                                           style: TextStyle(
            //                                               color: Colors.black,
            //                                               fontSize: 15,
            //                                               fontWeight: FontWeight.bold),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:  EdgeInsets.only(left: 15),
            //                                         child: Text(snapshot.data["data"][index]["booking_id"].toString(),
            //
            //                                           style:  TextStyle(
            //                                             color: Colors.black87,
            //                                             fontSize: 20,
            //                                             fontWeight: FontWeight.w500,
            //                                           ),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                             Padding(
            //                               padding: EdgeInsets.all(8.0),
            //                               child: Column(
            //                                 children: [
            //
            //                                   Row(
            //                                     mainAxisAlignment: MainAxisAlignment.start,
            //                                     children: [
            //                                       Padding(
            //                                         padding: EdgeInsets.only(left: 25),
            //                                         child: Text(
            //                                           "name  :",
            //                                           style: TextStyle(
            //                                               color: Colors.black,
            //                                               fontSize: 15,
            //                                               fontWeight: FontWeight.bold),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:  EdgeInsets.only(left: 15),
            //                                         child: Text(snapshot.data["data"][index]["user_name"].toString(),
            //
            //                                           style:  TextStyle(
            //                                             color: Colors.black87,
            //                                             fontSize: 20,
            //                                             fontWeight: FontWeight.w500,
            //                                           ),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                             Padding(
            //                               padding: EdgeInsets.all(8.0),
            //                               child: Column(
            //                                 children: [
            //
            //                                   Row(
            //                                     mainAxisAlignment: MainAxisAlignment.start,
            //                                     children: [
            //                                       Padding(
            //                                         padding: EdgeInsets.only(left: 25),
            //                                         child: Text(
            //                                           "date  :",
            //                                           style: TextStyle(
            //                                               color: Colors.black,
            //                                               fontSize: 15,
            //                                               fontWeight: FontWeight.bold),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:  EdgeInsets.only(left: 15),
            //                                         child: Text(snapshot.data["data"][index]["date"].toString(),
            //
            //                                           style:  TextStyle(
            //                                             color: Colors.black87,
            //                                             fontSize: 20,
            //                                             fontWeight: FontWeight.w500,
            //                                           ),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                             Padding(
            //                               padding: EdgeInsets.all(8.0),
            //                               child: Column(
            //                                 children: [
            //
            //                                   Row(
            //                                     mainAxisAlignment: MainAxisAlignment.start,
            //                                     children: [
            //                                       Padding(
            //                                         padding: EdgeInsets.only(left: 25),
            //                                         child: Text(
            //                                           "address  :",
            //                                           style: TextStyle(
            //                                               color: Colors.black,
            //                                               fontSize: 15,
            //                                               fontWeight: FontWeight.bold),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:  EdgeInsets.only(left: 15),
            //                                         child: Text(
            //                                           snapshot.data["data"][index]["address"].toString(),
            //                                           style:  TextStyle(
            //                                             color: Colors.black87,
            //                                             fontSize: 20,
            //                                             fontWeight: FontWeight.w500,
            //                                           ),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                             Padding(
            //                               padding: EdgeInsets.all(8.0),
            //                               child: Column(
            //                                 children: [
            //
            //                                   Row(
            //                                     mainAxisAlignment: MainAxisAlignment.start,
            //                                     children: [
            //                                       Padding(
            //                                         padding: EdgeInsets.only(left: 25),
            //                                         child: Text(
            //                                           "phonenumber  :",
            //                                           style: TextStyle(
            //                                               color: Colors.black,
            //                                               fontSize: 15,
            //                                               fontWeight: FontWeight.bold),
            //                                         ),
            //                                       ),
            //                                       Padding(
            //                                         padding:  EdgeInsets.only(left: 15),
            //                                         child: Text(snapshot.data["data"][index]["phone_number"].toString(),
            //
            //                                           style:  TextStyle(
            //                                             color: Colors.black87,
            //                                             fontSize: 20,
            //                                             fontWeight: FontWeight.w500,
            //                                           ),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //
            //
            //
            //                             Row(
            //                               mainAxisAlignment: MainAxisAlignment.center,
            //                               children: [
            //                                 Padding(
            //                                   padding:  EdgeInsets.all(5),
            //                                   child: ElevatedButton(
            //                                       style: ButtonStyle(
            //                                           backgroundColor:
            //                                           MaterialStateProperty.all<Color>(
            //                                               Color(0xff5ac18e)),
            //                                           shape: MaterialStateProperty.all<
            //                                               RoundedRectangleBorder>(
            //                                               RoundedRectangleBorder(
            //                                                   borderRadius:
            //                                                   BorderRadius.circular(10))),
            //                                           minimumSize:
            //                                           MaterialStateProperty.all<Size>(
            //                                               Size(150, 60))),
            //                                       onPressed: () {
            //                                         approvebooking(snapshot.data["data"][index]["booking_id"].toString());
            //                                       },
            //                                       child:  Text(
            //                                         "Accept",
            //                                         style: TextStyle(color: Colors.black),
            //                                       )),
            //                                 ),
            //                                 // Padding(
            //                                 //   padding:  EdgeInsets.all(10),
            //                                 //   child: ElevatedButton(
            //                                 //       style: ButtonStyle(
            //                                 //           backgroundColor:
            //                                 //               MaterialStateProperty.all<Color>(
            //                                 //                   Colors.white60),
            //                                 //           shape: MaterialStateProperty.all<
            //                                 //                   RoundedRectangleBorder>(
            //                                 //               RoundedRectangleBorder(
            //                                 //                   borderRadius:
            //                                 //                       BorderRadius.circular(10))),
            //                                 //           minimumSize:
            //                                 //               MaterialStateProperty.all<Size>(
            //                                 //                    Size(150, 60))),
            //                                 //       onPressed: () {},
            //                                 //       child:  Text(
            //                                 //         "Reject",
            //                                 //         style: TextStyle(color: Colors.black),
            //                                 //       )),
            //                                 // )
            //                               ],
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   );
            //                 }
            //             ),
            //           );
            //         } else {
            //
            //           return Text("somthing went wrong");
            //         }
            //       }),
            // ),
            SizedBox(
              height: 30,
            ),

          ],
        ),
      ),
    );
  }
}
