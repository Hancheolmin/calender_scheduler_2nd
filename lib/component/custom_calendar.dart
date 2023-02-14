import 'package:calender_scheduler_2nd/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDay;

  const CustomCalendar({
    required this.onDaySelected,
    required this.selectedDay,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration defaultBoxDecoration = BoxDecoration(
      color: Colors.grey[200],
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: selectedDay,
      firstDay: DateTime(1800, 1, 1),
      lastDay: DateTime(3000, 12, 31),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontFamily: 'notoSans',
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }
        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
      calendarStyle: CalendarStyle(
        todayDecoration: defaultBoxDecoration.copyWith(
          color: Colors.green[400],
        ),
        defaultDecoration: defaultBoxDecoration,
        weekendDecoration: defaultBoxDecoration,
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        selectedTextStyle: TextStyle(
          color: primaryColor,
        ),
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
