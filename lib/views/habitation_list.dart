import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/models/habitation.dart';

class HabitationList extends StatelessWidget {
  final bool isHouseList;

  HabitationList(this.isHouseList, {Key? key}) : super(key: key);

  final _habitations = [
    Habitation(2, "appartement.png", "Appartement 2", "Rue 2", 3, 1, 50, 555),
    Habitation(3, "appartement.png", "Appartement 3", "Rue 3", 2, 1, 51, 401),
    Habitation(4, "appartement.png", "Appartement 4", "Rue 4", 2, 1, 52, 402),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Liste des ${this.isHouseList ? 'maisons' : 'appartements'}"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _habitaitons.lenght,
          itemBuilder: (context, index) =>
              _buildRow(_habitations[index], context),
          itemExtent: 285,
        ),
      ),
    );
  }

  _buildRow(Habitation habitation, BuildContext context) {
    return Container(
      margin: EdgeINsets.all(4.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/locations/${habitation.image}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          _buildDetails(habitation),
        ],
      ),
    );
  }

  _buildDetails(Habitation habitation) {
    // var format = NumberFormat("### $");
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(habitation.libelle),
                  subtitle: Text(habitation.adresse),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  format.format(habitation.prixmois),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 22,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HabitationOption(Icons.group, "${habitation.chambres} personnes"),
              HabitationOption(Icons.fit_screen, "${habitation.superficie} m²"),
            ],
          ),
        ],
      ),
    );
  }
}
