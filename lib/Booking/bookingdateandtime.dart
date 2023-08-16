import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
      appBar: AppBar(),
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
                  Text("Select Time", style:TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6),
                  )),

                ],
              ),
            ),
            _isweekend ?SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                child:  Text("weekend is not avalilable,please select another date", style:TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6),
                )),
              ),
            ):
                SliverGrid(delegate: SliverChildBuilderDelegate((context, index){
                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        _currentIndex=index;
                        _timeselected=true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex ==index
                              ? Colors.white:
                              Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: _currentIndex==index
                          ? Color(0x665ac18e):null,
                      ),
                      alignment: Alignment.center,
                      child: Text('${index + 9 }:00 ${index +9>11 ? "PM" :"AM"}',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _currentIndex == index ? Colors.white:null,
                      ),),
                    ),
                  );
                } ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4,childAspectRatio:1.5, )
                )

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