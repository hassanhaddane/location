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

class MyHomePage extends StatelessWidget {
  final String title;
  final HabitationService habitationService = HabitationService();
  late List<TypeHabitat> _typeHabitats;
  late List<Habitation> _habitations;
  MyHomePage({required this.title, Key? key}) : super(key: key) {
    _habitations = habitationService.getHabitationsTop10();
    _typeHabitats = habitationService.getTypeHabitats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildTypeHabitat(context),
              const SizedBox(height: 20),
              _buildDerniereLocation(context)
            ],
          )),
    );
  }
