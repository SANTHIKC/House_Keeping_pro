import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingDateandTime extends StatefulWidget {
  const BookingDateandTime({Key? key}) : super(key: key);

  @override
  State<BookingDateandTime> createState() => _BookingDateandTimeState();
}

class _BookingDateandTimeState extends State<BookingDateandTime> {
  CalendarFormat _format=CalendarFormat.month;
  DateTime _focusdate=DateTime.now();
  DateTime _currentdate=DateTime.now();
  int? _currentIndex;
  bool _isweekend=false;
  bool _dateselected=false;
  bool _timeselected =false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: [



        ],
      )),
    );




  }
}
