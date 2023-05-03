import 'package:flutter/material.dart';

class EventModel {
  //Att
  String _eventName;
  DateTime _eventDateTime;
  TimeOfDay _eventTime;

  //Const
  EventModel(this._eventName, this._eventDateTime, this._eventTime);

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
}
