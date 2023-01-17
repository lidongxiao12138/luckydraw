import 'package:flutter/material.dart';
import 'package:scan_gun/binding/scan_input_binding.dart';
import 'luckydraw/luckdarw.dart';
import 'package:scan_gun/scan_monitor_widget.dart';

void main() {
  TextInputBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const luckydrawBody(),
    );
  }
}

