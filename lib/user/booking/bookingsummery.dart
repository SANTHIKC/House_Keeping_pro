import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appConstants/appConstants.dart';
import 'bookingsuccess.dart';

class BookingSummery extends StatefulWidget {
  final focusedDay;
  final String selectedService;

  BookingSummery({required this.focusedDay, required this.selectedService});

  @override
  State<BookingSummery> createState() => _BookingSummeryState();
}

class _BookingSummeryState extends State<BookingSummery> {
  @override
  Widget build(BuildContext context) {
    // String dropdownValue = widget.selectedServicelistname.first;

    Future<dynamic> getuserdata() async {
      final url = "${AppConstants.url}singleuserdataview.php";

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? user_id = prefs.getString("id");

      var response = await post(Uri.parse(url), body: {"user_id": user_id});
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        return body;
      }
    }

    DateTime focusedDay = widget.focusedDay;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5ac18e),
        title: const Text(
          "Booking Summery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            "Category",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 5),
                          child: Text(
                            widget.selectedService,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Booked Date",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Text(
                            "${widget.focusedDay.year}-${widget.focusedDay.month}-${widget.focusedDay.day}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Container(
            //     height: 100,
            //     child:
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         const Text(
            //           "Services",
            //           style: TextStyle(
            //             color: Colors.black54,
            //             fontSize: 18,
            //
            //
            //           ),
            //         ),
            //
            //         // Container(
            //         //  margin: EdgeInsets.only(right: 200),
            //         //   width: 30,
            //         //   child:
            //         SizedBox(
            //           width: 280,
            //           child: DropdownMenu<String>(
            //             initialSelection: widget.selectedServicelistname.first,
            //             onSelected: (String? value) {
            //               // This is called when the user selects an item.
            //               setState(() {
            //                 dropdownValue = value!;
            //               });
            //             },
            //             dropdownMenuEntries: widget.selectedServicelistname.map<DropdownMenuEntry<String>>((String value) {
            //               return DropdownMenuEntry<String>(value: value, label: value);
            //             }).toList(),
            //           ),
            //         ),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: FutureBuilder(
                  future: getuserdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "Address",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 110),
                                  child: Text(
                                    snapshot.data["data"]["address"].toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "Phone Number",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Text(
                                    snapshot.data["data"]["phone_number"]
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "Charge For 1 Hour",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 80),
                                  child: Text(
                                    "RS: 350",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Text("somthing went wrong");
                    }
                  }),
            ),
            const SizedBox(
              height: 30,
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0x665ac18e),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(330, 60))),
                onPressed: () async {
                  final url = "${AppConstants.url}booking.php";
                  "${AppConstants.url}singleuserdataview.php";

                  // final address =  snapshot.data["data"]["address"].toString();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? user_id = prefs.getString("id");
                  String user_name = ''; // Replace with the user's name
                  String service_type = widget.selectedService;
                  String address = ''; // Replace with the user's address
                  String phone_number =
                      ''; // Replace with the user's phone number
                  String date =
                      "${widget.focusedDay.year}-${widget.focusedDay.month}-${widget.focusedDay.day}";
                  String image = ''; // Replace with the image data


                  // Create the request body
                  var body = {
                    "user_id": user_id,
                    "user_name": user_name,
                    "service_type": service_type,
                    "address": address,
                    "phone_number": phone_number,
                    "date": date,
                  };

                  // Send the POST request with the data
                  var response = await post(Uri.parse(url), body: body);
                  print(response);

                  if (response.statusCode == 200) {
                    print(response.body);
                    var body = jsonDecode(response.body);
                    return body;
                  }

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const BookingSuccess();
                    },
                  ));
                },
                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
