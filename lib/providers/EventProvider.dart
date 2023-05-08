import 'dart:async';

import 'package:flutter/material.dart';
import '../model/EventModel.dart';

class EventProvider extends ChangeNotifier {
  List<EventModel> eventList = <EventModel>[];

  //Aux vars
  String currentEventName = '';
  DateTime currentDateTime = DateTime.now();
  TimeOfDay currentEventTime = TimeOfDay.now();
  String currentCountdown = '';

  //Im not proud of this code below, cant use nested notifyListerners :(
  updateUI() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        final now = DateTime.now();
        final endDate = DateTime(2040, 12, 12);

        var duration = endDate.difference(now);

        if (duration.inSeconds <= 0) {
          timer.cancel();
        } else {
          notifyListeners();
        }
      },
    );
  }

  addEvent(String eventName, DateTime dateTime, TimeOfDay eventTime,
      String eventCountdown) {
    //auxInstance
    EventModel event = EventModel(
        currentEventName, currentDateTime, currentEventTime, currentCountdown);
    event.startCountdown();
    eventList.add(event);

    notifyListeners();
  }

  removeEvent(EventModel event) {
    //auxInstance
    eventList.remove(event);
    notifyListeners();
  }
}
