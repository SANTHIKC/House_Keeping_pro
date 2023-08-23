import 'package:flutter/material.dart';

import 'bookingsuccess.dart';

class BookingSummery extends StatefulWidget {
  const BookingSummery({Key? key}) : super(key: key);

  @override
  State<BookingSummery> createState() => _BookingSummeryState();
}

class _BookingSummeryState extends State<BookingSummery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff5ac18e),
        title: Text(
          "Booking Summery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
      body:
      SafeArea(
        child:ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Service",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,


                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Repair Service",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,


                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Category",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,


                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Electrician",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,


                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Booked Date",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,


                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "19-08-2023",
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
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Address",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,


                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Kozhikode,Kerala,India",
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
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Charge For 1 Hour",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,


                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Total",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 18,


                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "RS: 350",
                            style: TextStyle(
                              color: Colors.deepPurple,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 80),
              child: ElevatedButton(
                style: ButtonStyle(

                    backgroundColor:
                    MaterialStateProperty.all<Color>(  Color(0x665ac18e),),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    minimumSize:
                    MaterialStateProperty.all<Size>(Size(330, 60))

                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return BookingSuccess();
                  },));

                },



                child: Text(
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
