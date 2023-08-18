import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../houseservicepage.dart';

class BookingSuccess extends StatefulWidget {
  const BookingSuccess({Key? key}) : super(key: key);

  @override
  State<BookingSuccess> createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff5ac18e),
       leading:  Icon(
         Icons.arrow_back,
         color: Colors.white,
         size: 35,
       ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(15),
              child: Expanded(
                  flex:3,
        child: Lottie.asset('assetss/animation/tick.json')),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "Booking Successfully ",

                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
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
                    return HouseServicepage();
                  },));

                },



                child: Text(
                  "back to home page",
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
