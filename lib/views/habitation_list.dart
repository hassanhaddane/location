import 'package:flutter/cupertino.dart';
import 'package:location/models/habitation.dart';

class HabitationList extends StatelessWidget {
  final bool isHouseList;
  HabitationList(this.isHouseList, {Key? key}) : super(key: key);

  final _habitations = [
    Habitation(2, "appartement.png" , "Appartement 2", "Rue 2", 3, 1, 50, 555),
    Habitation(3, "appartement.png" , "Appartement 3", "Rue 3", 2, 1, 51, 401),
    Habitation(4, "appartement.png" , "Appartement 4", "Rue 4", 2, 1, 52, 402),
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
