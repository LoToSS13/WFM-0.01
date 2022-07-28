import 'package:flutter/material.dart';
import 'package:wfm_mobile_app/features/calendar/models/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({required this.event});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Container(
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: event.eventBorderColor.withOpacity(0.7)),
              color: event.eventBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    event.timeInterval,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      event.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(event.duration,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 18.0,
                      )),
                )
              ],
            )));
  }
}
