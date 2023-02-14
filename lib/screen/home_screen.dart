import 'package:calender_scheduler_2nd/component/custom_calendar.dart';
import 'package:calender_scheduler_2nd/component/schedule_card.dart';
import 'package:calender_scheduler_2nd/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../component/add_schedule_list.dart';
import '../component/calendar_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddScheduleList(),
      body: SafeArea(
        child: Column(
          children: [
            CustomCalendar(
              onDaySelected: onDaySelected,
              selectedDay: selectedDay,
            ),
            SizedBox(height: 10),
            CalendarBanner(
              selectedDay: selectedDay,
              scheduleCount: 4,
            ),
            SizedBox(height: 10),
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ScheduleCard(
            startTime: 10,
            endTime: 8,
            content: 'flutter study',
            color: Colors.red,
          );
        },
      ),
    );
  }
}
