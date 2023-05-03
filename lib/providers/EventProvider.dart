import 'package:flutter/material.dart';
import '../model/EventModel.dart';

class EventProvider extends ChangeNotifier {
  List<EventModel> eventList = <EventModel>[];

  //Aux vars
  String currentEventName = '';
  DateTime currentDateTime = DateTime.now();
  TimeOfDay currentEventTime = TimeOfDay.now();

  addEvent(String eventName, DateTime dateTime, TimeOfDay eventTime) {
    //auxInstance
    EventModel event =
        EventModel(currentEventName, currentDateTime, currentEventTime);
    eventList.add(event);

    notifyListeners();
  }
}
