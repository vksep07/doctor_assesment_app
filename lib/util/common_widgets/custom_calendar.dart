import 'package:doctor_app_assessment/util/colors.dart';
import 'package:doctor_app_assessment/util/common_widgets/extensions.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController = ScrollController(); //Scroll Controller for ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ]; //List Of Months

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]; //List of Days

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        //Text Widget to Show Current Date
        /*Container(
            height: 30,
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              selectedDate.day.toString() +
                  '-' +
                  listOfMonths[selectedDate.month - 1] +
                  ', ' +
                  selectedDate.year.toString(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo[700]),
            )),
        SizedBox(height: 10),*/

        //ListView Widget for the Calendar
        Container(
            height: 90,
            child: Container(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                  itemCount: 365,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                   clipBehavior: Clip.none,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentDateSelectedIndex = index;
                          selectedDate =
                              DateTime.now().add(Duration(days: index));
                        });
                      },
                      child: Container(
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                        /*    boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 5)
                            ],*/
                            color: currentDateSelectedIndex == index
                                ? AppColors.primary
                                : Colors.blue.withOpacity(0.1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          /*  10.heightBox,
                            Text(
                              listOfMonths[DateTime.now()
                                  .add(Duration(days: index))
                                  .month -
                                  1]
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: currentDateSelectedIndex == index
                                      ? Colors.white
                                      : Colors.grey),
                            ),*/
                            5.heightBox,
                            Text(
                              listOfDays[DateTime.now()
                                  .add(Duration(days: index))
                                  .weekday -
                                  1]
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: currentDateSelectedIndex == index
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                           5.heightBox,
                            Text(
                              DateTime.now()
                                  .add(Duration(days: index))
                                  .day
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: currentDateSelectedIndex == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ))),
      ],
    );
  }
}