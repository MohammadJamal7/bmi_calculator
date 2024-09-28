import 'Screens/Result.dart';
import 'package:bmi_app/Screens/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Result.id: (context) => Result(),
      },
      theme: ThemeData(
        useMaterial3: true,
          primarySwatch: Colors.teal,
          canvasColor: const Color.fromARGB(221, 241, 195, 195),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 24,
                letterSpacing: 2,
                color: Color.fromARGB(255, 13, 0, 13),
                fontWeight: FontWeight.bold),
          )),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
