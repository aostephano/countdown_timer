import 'package:flutter/material.dart';
import '../model/EventModel.dart';
import 'dart:async';

class EventProvider extends ChangeNotifier {
  List<EventModel> eventList = <EventModel>[];

  //Aux vars
  String currentEventName = '';
  DateTime currentDateTime = DateTime.now();
  TimeOfDay currentEventTime = TimeOfDay.now();
  String currentCountdown = '';

  addEvent(String eventName, DateTime dateTime, TimeOfDay eventTime) {
    //auxInstance
    EventModel event =
        EventModel(currentEventName, currentDateTime, currentEventTime);
    eventList.add(event);

    notifyListeners();
  }

  void startCountdown(DateTime finalDateTime, TimeOfDay finalTimeOfDay) {
    final now = DateTime.now();
    final endDate = DateTime(finalDateTime.year, finalDateTime.month,
        finalDateTime.day, finalTimeOfDay.hour, finalTimeOfDay.minute);

    var duration = endDate.difference(now);

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration.inSeconds <= 0) {
        currentCountdown = "Duração em Segundos: ${duration.inSeconds}";
        notifyListeners();
        timer.cancel();
      } else {
        duration -= Duration(seconds: 1);
        final days = duration.inDays;
        final hours = duration.inHours;
        final minutes = duration.inMinutes.remainder(60);
        final seconds = duration.inSeconds.remainder(60);

        // currentCountdown = "newStringValue";
        currentCountdown =
            '${days.toString()}:${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        notifyListeners();
      }
    });

    // notifyListeners();
  }
}
