import 'package:countdown_timer/widgets/InsertName.dart';
import 'package:countdown_timer/widgets/InsertDateTime.dart';
import 'package:flutter/material.dart';

class DisplayInputs extends StatefulWidget {
  const DisplayInputs({Key? key}) : super(key: key);

  @override
  State<DisplayInputs> createState() => _DisplayInputsState();
}

class _DisplayInputsState extends State<DisplayInputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InsertName(),
        InsertDateTime(),
      ],
    );
  }
}
