import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/EventProvider.dart';

class DisplayCountdown extends StatefulWidget {
  const DisplayCountdown({Key? key}) : super(key: key);

  @override
  State<DisplayCountdown> createState() => _DisplayCountdownState();
}

class _DisplayCountdownState extends State<DisplayCountdown> {
  @override
  Widget build(BuildContext context) {
    var eventState = context.watch<EventProvider>();
    var eventList = eventState.eventList;
    eventState.updateUI();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          eventList.isEmpty
              ? Text("")
              : ListTile(
                  leading: Icon(Icons.timelapse_rounded),
                  title: Text(eventList.last.eventName),
                  subtitle: Text(
                      "DateTime: ${eventList.last.eventDateTime} | Time: ${eventList.last.eventTime} | Countdown:${eventList.last.eventCountdown} "),
                )
        ],
      ),
    );
  }
}
