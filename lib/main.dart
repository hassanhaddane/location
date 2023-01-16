import 'package:flutter/material.dart';
import 'package:tdlocation/models/habitation_service.dart';
import 'package:tdlocation/share/location_style.dart';
import 'package:tdlocation/share/location_text_style.dart';
import 'package:tdlocation/views/habitation_list.dart';

import 'models/habitation.dart';
import 'models/typehabitat.dart';

// We need this function to run the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Locations'),
    );
  }
}

