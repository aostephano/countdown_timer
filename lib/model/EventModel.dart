import 'dart:async';
import 'package:flutter/material.dart';

class EventModel extends ChangeNotifier {
  //Att
  String _eventName;
  DateTime _eventDateTime;
  TimeOfDay _eventTime;
  String _eventCountdown;

  //Const
  EventModel(this._eventName, this._eventDateTime, this._eventTime,
      this._eventCountdown);

  String get eventName => _eventName;

  //Getters and Setters
  set eventName(String value) {
    _eventName = value;
  }

  TimeOfDay get eventTime => _eventTime;

  set eventTime(TimeOfDay value) {
    _eventTime = value;
  }

  DateTime get eventDateTime => _eventDateTime;

  set eventDateTime(DateTime value) {
    _eventDateTime = value;
  }

  String get eventCountdown {
    return _eventCountdown;
  }

  set eventCountdown(String value) {
    _eventCountdown = value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'EventModel{_eventName: $_eventName, _eventDateTime: $_eventDateTime, _eventTime: $_eventTime, _eventCountdown: $_eventCountdown}';
  }

  void startCountdown() {
    final now = DateTime.now();
    final endDate = DateTime(_eventDateTime.year, _eventDateTime.month,
        _eventDateTime.day, _eventTime.hour, _eventTime.minute);

    var duration = endDate.difference(now);

    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (duration.inSeconds <= 0) {
          eventCountdown = "Evento encerrado: ${duration.inSeconds}";
          timer.cancel();
          notifyListeners();
        } else {
          duration -= Duration(seconds: 1);
          final days = duration.inDays;
          final hours = duration.inHours;
          final minutes = duration.inMinutes.remainder(60);
          final seconds = duration.inSeconds.remainder(60);

          eventCountdown =
              '${days.toString()}:${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
          debugPrint("EventName: ${eventName} | Countdown: $eventCountdown");
          notifyListeners();
        }
      },
    );
  }
}
