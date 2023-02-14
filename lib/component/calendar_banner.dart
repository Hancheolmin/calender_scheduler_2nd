import 'package:flutter/material.dart';

import '../const/color.dart';

class CalendarBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;

  const CalendarBanner({
    required this.selectedDay,
    required this.scheduleCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '$scheduleCount개',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
