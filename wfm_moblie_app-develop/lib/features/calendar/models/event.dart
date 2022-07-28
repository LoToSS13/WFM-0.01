import 'dart:ui';

class Event {
  final String title;
  final String timeInterval;
  final String duration;
  final Color eventBorderColor;
  final Color eventBackgroundColor;

  Event(this.title, this.timeInterval, this.duration, this.eventBorderColor,
      this.eventBackgroundColor);

  @override
  String toString() {
    return 'Event{title: $title, timeInterval: $timeInterval, duration: $duration, eventBorderColor: $eventBorderColor, eventBackgroundColor: $eventBackgroundColor}';
  }
}