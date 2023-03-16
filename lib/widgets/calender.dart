import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendar extends StatefulWidget {
  const BookingCalendar({Key? key}) : super(key: key);

  @override
  _BookingCalendarState createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      firstDay: DateTime(2021),
      lastDay: DateTime(2022),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
