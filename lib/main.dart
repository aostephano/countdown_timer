import 'package:countdown_timer/pages/MyHomePage.dart';
import 'package:countdown_timer/providers/EventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

//Instantiates providers when app is up
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Countdown Time',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
