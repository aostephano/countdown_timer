import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/EventProvider.dart';

//Date and time by Mutafa Tahir on: https://medium.com/@mustafatahirhussein/datepicker-timepicker-a-flutter-guide-e9c06f879279

class InsertDateTime extends StatefulWidget {
  const InsertDateTime({Key? key}) : super(key: key);

  @override
  State<InsertDateTime> createState() => _InsertDateTimeState();
}

class _InsertDateTimeState extends State<InsertDateTime> {
  final _dateC = TextEditingController();
  final _timeC = TextEditingController();

  ///Date
  DateTime selectedDateTime = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

  ///Time
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildUI(context),
    );
  }

  Widget buildUI(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            TextFormField(
              controller: _dateC,
              decoration: const InputDecoration(
                  labelText: 'Date picker', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () => displayDatePicker(context),
                child: const Text("Pick Date")),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            TextFormField(
              controller: _timeC,
              decoration: const InputDecoration(
                  labelText: 'Time picker', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () => displayTimePicker(context),
                child: const Text("Pick Time")),
          ],
        )
      ],
    );
  }

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      //PROVIDER
      setState(() {
        _dateC.text = date.toLocal().toString().split(" ")[0];
      });

      //Add DateTime to Provider Aux Var
      var eventState = context.watch<EventProvider>();
      eventState.currentDateTime = date;
    }
  }

  Future displayTimePicker(BuildContext context) async {
    var time =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (time != null) {
      //PROVIDER
      setState(() {
        _timeC.text = "${time.hour}:${time.minute}";
        debugPrint("Imhere");
      });

      //Add Time to Provider Aux Var
      var eventState = context.watch<EventProvider>();
      TimeOfDay currentTime = TimeOfDay(hour: time.hour, minute: time.minute);
      eventState.currentEventTime = currentTime;
    }
  }
}
