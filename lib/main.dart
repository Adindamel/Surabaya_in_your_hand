import 'package:surabaya_in_your_hand/model/wisata.dart';
import 'package:surabaya_in_your_hand/ui/list_wisata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ListWisataPage(),
    );
  }
}
