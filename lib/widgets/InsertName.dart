import 'package:flutter/material.dart';

class InsertName extends StatefulWidget {
  const InsertName({Key? key}) : super(key: key);

  @override
  State<InsertName> createState() => _InsertNameState();
}

class _InsertNameState extends State<InsertName> {
  final _textFieldController = TextEditingController();
  String eventName = '';

  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      eventName = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        controller: _textFieldController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter name event',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
