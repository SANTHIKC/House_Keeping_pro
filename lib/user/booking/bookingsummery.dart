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
    int? booking_id; // Declare booking_id variable

    Future<void> fetchBookingId() async {
      final url = "${AppConstants.url}booking.php";

      // Make a GET request to fetch the booking_id
      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('data');

        return data;
      }
    }

    Map<String, dynamic> userData = {};

    Future<dynamic> getuserdata() async {
      final url = "${AppConstants.url}singleuserdataview.php";

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? user_id = prefs.getString("user_id");

      var response = await post(Uri.parse(url), body: {"user_id": user_id});

      if (response.statusCode == 200) {
        // print(response.body);
        var body = jsonDecode(response.body);

        return body;
      }
    }

    DateTime focusedDay = widget.focusedDay;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text("Booking Details",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black.withOpacity(0.7),
                  )),
            ),
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
                          padding: const EdgeInsets.only(top: 20, right: 70),
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
                        height: 250,
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
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data["data"]["address"]
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
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
                            // CircleAvatar(
                            //   radius: 50,
                            //   backgroundImage: NetworkImage(
                            //       "${AppConstants.url}/image/${snapshot.data["data"]["photo"]}"),
                            // )
                          ],
                        ),
                      );
                    } else {
                      return const Text("somthing went wrong");
                    }
                  }),
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
                  final url1 = "${AppConstants.url}singleuserdataview.php";

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? user_id = prefs.getString("user_id");

                  var response1 =
                      await post(Uri.parse(url1), body: {"user_id": user_id});
                  var body1 = jsonDecode(response1.body);

                  if (response1.statusCode == 200) {
                    // print(response.body);
                    body1 = jsonDecode(response1.body);
                  }

                  final url = "${AppConstants.url}booking.php";

                  // final userData = await getuserdata();

                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // String? user_id = prefs.getString("user_id");
                  print('bookingpage${user_id}');

                  String? user_name = body1['data']['user_name'] ?? '';
                  //
                  String? service_type = widget.selectedService;
                  String? address = body1['data']['address'] ?? '';

                  String? phone_number = body1['data']['phone_number'] ?? '';
                  String date =
                      "${widget.focusedDay.year}-${widget.focusedDay.month}-${widget.focusedDay.day}";

                  // Create the request body
                  var data = {
                    // "booking_id": booking_id,
                    "user_id": user_id,
                    "user_name": user_name,
                    "service_type": service_type,
                    "address": address,
                    "phone_number": phone_number,
                    "date": date,
                  };

                  // Send the POST request with the data
                  var response = await post(Uri.parse(url), body: data);

                  if (response.statusCode == 200) {
                    print('success1');
                    print(response.body);
                    // return body;
                  } else {
                    print('Failed');
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
