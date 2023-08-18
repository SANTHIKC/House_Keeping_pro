import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

          ],
        ),
      ),
    );
  }
}
