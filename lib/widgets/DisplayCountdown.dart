import 'package:flutter/cupertino.dart';
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
    return Container(
      child: Column(
        children: [
          Text("Countdown Timer"),
          Text("${eventState.currentCountdown}"),
          Text("-------"),
        ],
      ),
    );
  }
}
