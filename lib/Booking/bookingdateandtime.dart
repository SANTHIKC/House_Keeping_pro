

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import 'bookingsummery.dart';





class BookingDateandTime extends StatefulWidget {


  const BookingDateandTime({Key? key}) : super(key: key);


  @override
  State<BookingDateandTime> createState() => _BookingDateandTimeState();
}

class _BookingDateandTimeState extends State<BookingDateandTime> {



  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusdate = DateTime.now();
  DateTime _currentdate = DateTime.now();
  int? _currentIndex;
  bool _isweekend = false;
  bool _dateselected = false;
  bool _timeselected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff5ac18e),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
               _tableCalendar(),

               SizedBox(
                 height: 15,
               ),


                ],
              ),
            ),


            SliverToBoxAdapter(
              child: Container(
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
                  onPressed: () async{

                     var date = DateTime(  _focusdate.year,_focusdate.month,_focusdate.day,);
                    SharedPreferences prefs = await SharedPreferences.getInstance();


                   String selectedServiceName = prefs.getString('selectedServiceName')??"";
                    print(selectedServiceName);
                   List<String>? selectedServices = prefs.getStringList('selectedServiceList');





                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return BookingSummery(
                        focusedDay: _focusdate,
                        selectedService: selectedServiceName,
                        selectedServicelistname: selectedServices!,


                      );
                    },));

                  },



                  child: Text(
                    "Booking Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
  //tablecalendar setting
 Widget _tableCalendar(){
    return TableCalendar(focusedDay: _focusdate,
        firstDay: DateTime.now(),
        lastDay: DateTime(2025,12,31),
      calendarFormat: _format,
      currentDay: _currentdate,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Color(0x665ac18e),shape: BoxShape.circle,
        ),

      ),
      availableCalendarFormats: {
      CalendarFormat.month:'Month',
      },
      onFormatChanged: (format){
      setState(() {
        _format=format;
      });
      },
      onDaySelected: ((selectDay,focusDay){
        setState(() {
          _currentdate=selectDay;
          _focusdate=focusDay;
          _dateselected=true;
          if(selectDay.weekday == 6 || selectDay.weekday==7){
            _isweekend =true;
            _timeselected=false;
            _currentIndex=null;
          }
          else{
            _isweekend =false;
          }
        });
      }),
    );
 }
}
