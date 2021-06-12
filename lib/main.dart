import 'package:bootcamp_flutter/app/view/bootcamps_list.dart';
import 'package:flutter/material.dart';
import 'app/view/bootcamp_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inifinitum Bootcamps',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => BootcampList(),
        '/bootcampDetails': (context) => BootcampDetails(),
      },
    );
  }
}

