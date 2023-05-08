import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/EventProvider.dart';
import '../../widgets/DisplayCountdown.dart';
import '../../widgets/DisplayInputs.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var eventState = context.watch<EventProvider>();
    var eventList = eventState.eventList;
    eventState.addListener(() {});

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DisplayInputs(),
          SizedBox(
            height: 10,
          ),
          DisplayCountdown(),
        ],
      ),
    );
  }
}
