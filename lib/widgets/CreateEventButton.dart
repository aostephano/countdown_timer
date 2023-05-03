import 'package:countdown_timer/providers/EventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventButton extends StatefulWidget {
  const CreateEventButton({Key? key}) : super(key: key);

  @override
  State<CreateEventButton> createState() => _CreateEventButtonState();
}

class _CreateEventButtonState extends State<CreateEventButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            //PROVIDER
            var eventState = Provider.of<EventProvider>(context, listen: false);
            String currentEventName = eventState.currentEventName;
            DateTime currentDateTime = eventState.currentDateTime;
            TimeOfDay currentEventTime = eventState.currentEventTime;
            eventState.addEvent(
                currentEventName, currentDateTime, currentEventTime);
          },
          child: Text("Create Event"),
        ),
      ],
    );
  }
}
