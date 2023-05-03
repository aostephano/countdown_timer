import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/EventProvider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    var eventState = context.watch<EventProvider>();
    var eventList = eventState.eventList;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(eventList.toString()),
          // ListView.builder(
          //   itemCount: eventList.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     final event = eventList[index];
          //     return ListTile(
          //       title: Text(event.eventName),
          //       subtitle: Text("${event.eventDateTime} • ${event.eventTime}"),
          //       onTap: () {},
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
