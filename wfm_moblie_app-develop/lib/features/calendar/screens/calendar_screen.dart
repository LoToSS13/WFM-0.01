import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wfm_mobile_app/common/data_providers/profile_data_provider.dart';
import 'package:wfm_mobile_app/features/calendar/models/event.dart';

import '../widgets/event_widget.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final Map<DateTime, List<Event>> selectedEvents;

  final exampleDay1 = DateTime.parse('2022-07-16');
  final exampleDay2 = DateTime.parse('2022-07-17');

  final exampleDay3 = DateTime.parse('2022-07-19');
  final exampleDay4 = DateTime.parse('2022-07-20');

  final exampleDay5 = DateTime.parse('2022-07-24');
  final exampleDay6 = DateTime.parse('2022-07-25');

  MaterialColor markerColor = Colors.green;
  CalendarFormat format = CalendarFormat.month;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    //вот этого не должно существовать , это только для демо
    selectedEvents = {
      exampleDay1: [
        Event("Work Day", "10:00 - 18:00", "8h 00m", Colors.blueGrey,
            Colors.black12),
        Event("Work", "10:00 - 11:00", "1h 00m", Colors.green,
            Colors.transparent),
        Event("Break", "11:00 - 12:30", "1h 30m", Colors.orange,
            Colors.transparent),
        Event("Work", "12:30 - 14:00", "1h 30m", Colors.green,
            Colors.transparent),
        Event("Break", "14:00 - 15:00", "1h 00m", Colors.orange,
            Colors.transparent),
        Event("Work", "15:00 - 18:00", "3h 00m", Colors.green,
            Colors.transparent),
        Event("Break", "11:00 - 12:30", "1h 30m", Colors.orange,
            Colors.transparent),
        Event("Work", "12:30 - 14:00", "1h 30m", Colors.green,
            Colors.transparent),
        Event("Break", "14:00 - 15:00", "1h 00m", Colors.orange,
            Colors.transparent),
        Event(
            "Work", "15:00 - 18:00", "3h 00m", Colors.green, Colors.transparent)
      ],
      exampleDay2: [
        Event("Work Day", "7:00 - 18:00", "11h 00m", Colors.blueGrey,
            Colors.black12),
        Event(
            "Work", "7:00 - 10:00", "3h 00m", Colors.green, Colors.transparent),
        Event("Break", "10:00 - 12:30", "2h 30m", Colors.orange,
            Colors.transparent),
        Event("Work", "12:30 - 14:00", "1h 30m", Colors.green,
            Colors.transparent),
        Event("Break", "14:00 - 16:00", "2h 00m", Colors.orange,
            Colors.transparent),
        Event("Work", "16:00 - 18:00", "2h 00m", Colors.green,
            Colors.transparent),
      ],
      exampleDay3: [
        Event("Work Day", "6:00 - 16:00", "10h 00m", Colors.blueGrey,
            Colors.black12),
        Event(
            "Work", "6:00 - 10:00", "4h 00m", Colors.green, Colors.transparent),
        Event("Break", "10:00 - 11:30", "1h 30m", Colors.orange,
            Colors.transparent),
        Event("Work", "11:30 - 15:00", "3h 30m", Colors.green,
            Colors.transparent),
        Event("Break", "15:00 - 16:00", "1h 00m", Colors.orange,
            Colors.transparent),
        Event("Work", "16:00 - 18:00", "2h 00m", Colors.green,
            Colors.transparent),
      ],
      exampleDay4: [
        Event("Work Day", "10:00 - 19:00", "9h 00m", Colors.blueGrey,
            Colors.black12),
        Event("Work", "10:00 - 11:00", "1h 00m", Colors.green,
            Colors.transparent),
        Event("Break", "11:00 - 11:30", "0h 30m", Colors.orange,
            Colors.transparent),
        Event("Work", "11:30 - 15:00", "3h 30m", Colors.green,
            Colors.transparent),
        Event("Break", "15:00 - 16:00", "1h 00m", Colors.orange,
            Colors.transparent),
        Event("Work", "16:00 - 19:00", "3h 00m", Colors.green,
            Colors.transparent),
      ],
      exampleDay5: [
        Event("Work Day", "8:00 - 15:00", "7h 00m", Colors.blueGrey,
            Colors.black12),
        Event(
            "Work", "8:00 - 10:00", "2h 00m", Colors.green, Colors.transparent),
        Event("Break", "10:00 - 11:30", "1h 30m", Colors.orange,
            Colors.transparent),
        Event("Work", "11:30 - 15:00", "3h 30m", Colors.green,
            Colors.transparent),
        Event("Break", "15:00 - 15:00", "1h 00m", Colors.orange,
            Colors.transparent),
      ],
    };

    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ??
        [
          Event(
              "weekend",
              " ",
              " ",
              Colors.blue
                  .withOpacity(0.3), //костыльная реализация выходных дней
              Colors.blue.withOpacity(0.3))
        ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), label: 'My shifts'),
        BottomNavigationBarItem(
            icon: Icon(Icons.grading), label: 'My requests'),
        BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity), label: 'Profile'),
      ]),
      appBar: AppBar(
        title: const Text("Timetable"),
        actions: [
          IconButton(
              onPressed: () => {
                    ProfileDataProvider().setAccessToken(null),
                    ProfileDataProvider().setRefreshToken(null),
                  },
              icon: const Icon(Icons.search))
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat format) {
              setState(() {
                format = format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, _) {
                if (selectedEvents.containsKey(day)) {
                  markerColor = Colors.green;
                } else {
                  markerColor = Colors.blue;
                }
                return Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                      color: markerColor.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      day.day.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 14),
                    ),
                  ),
                );
              },
              outsideBuilder: (context, day, _) {
                return Center(
                  child: Text(day.day.toString(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 15,
                          color: Colors.blueGrey.withOpacity(0.7))),
                );
              },
              todayBuilder: (context, day, _) {
                return Center(
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        backgroundBlendMode: BlendMode.hardLight,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        day.day.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
              selectedBuilder: (context, day, _) {
                if (selectedEvents.containsKey(day)) {
                  markerColor = Colors.green;
                } else {
                  markerColor = Colors.blue;
                }
                return Center(
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: markerColor.withOpacity(0.3),
                      border: Border.all(color: Colors.grey, width: 3.5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        day.day.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),

            calendarStyle: const CalendarStyle(
              markersMaxCount: 0,
            ),

            headerStyle: HeaderStyle(
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 24.0,
              ),
              formatButtonVisible: true,
              titleCentered: false,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.deepOrange,
                backgroundBlendMode: BlendMode.hardLight,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => EventWidget(event: event),
          ),
        ],
      )),
    );
  }
}
