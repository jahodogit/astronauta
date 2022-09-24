import 'package:astronauta/route.dart';
import 'package:astronauta/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:astronauta/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Astronauta",
      theme: AstronautaTheme.generarTheme(),
      home: const HomePage(),
      routes: buildAppRoutes(),
    );
  }
}
