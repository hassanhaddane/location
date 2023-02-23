import 'package:flutter/material.dart';
import 'package:tdlocation/share/location_style.dart';
import 'package:tdlocation/share/location_text_style.dart';
import 'package:tdlocation/views/habitation_list.dart';
import 'package:tdlocation/views/habitation_service.dart';

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
      // routes: {
      //   Profil.routeName:(context) => const Profil(),
      //   LoginPage.routeName:(context) => const LoginPage('/'),
      //   LoginPage.routeName:(context) => const LocationList(),
      //   ValidatioLocation.routeName: (context) => const ValidationLocation(),
      // },
      // localizationDelegates: const [GlobalMaterialLocalization.delegate],
      // supportedLocales: const [Locale('en'), Locale('fr')],
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

  _buildTypeHabitat(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _typeHabitats.length,
          (index) => _buildHabitat(context, _typeHabitats[index]),
        ),
      ),
    );
  }

  _buildHabitat(BuildContext context, TypeHabitat typeHabitat) {
    var icon = Icons.house;
    switch (typeHabitat.id) {
      case 2:
        icon = Icons.apartment;
        break;
      default:
        icon = Icons.home;
    }

    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: LocationStyle.backgroundColorPurple,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HabitationList(isHouseList: typeHabitat.id == 1),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white70,
              ),
              const SizedBox(width: 5),
              Text(
                typeHabitat.libelle,
                style: LocationTextStyle.regularWhiteTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildDerniereLocation(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        itemCount: _habitations.length,
        itemExtent: 220,
        itemBuilder: (context, index) =>
            _buildRow(_habitations[index], context),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _buildRow(Habitation habitation, BuildContext context) {
    return Container(
        width: 240,
        margin: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                habitation.image,
                height: 150,
                width: 240,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              habitation.libelle,
              style: LocationTextStyle.regularTextStyle,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: LocationStyle.colorPurple,
                ),
                Text(habitation.adresse,
                    style: LocationTextStyle.regularTextStyle)
              ],
            ),
            Text(
              habitation.prixmois.toString(),
              style: LocationTextStyle.boldTextStyle,
            )
          ],
        ));
  }
}

// class BottomNavigationBarWidget extends StatelessWidget {
//   final int indexSelected;
//
//   const BottomNavigationBarWidget(this.indexSelected, {Ke: super(key: key)});
//
//   @override
//   Widget build(BuildContext context) {
//     bool isUserNotConntected = true;
//
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       currentIndex: indexSelected,
//       items: <BottomNavigationBarItem>[
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Acceuil',
//         ),
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: 'Recherche',
//         ),
//         BottomNavigationBarItem(
//             icon: isUserNotConntected
//                 ? const Icon(Icons.shopping_cart_outlined)
//                 : BadgeWidget(
//                     value: 0,
//                     top: 0,
//                     right: 0,
//                     child: const Icon(Icons.shopping_cart),
//                   ),
//             label: 'locations'),
//       ],
//       onTap: (index) {
//         String page = '/';
//         switch (index) {
//           case 2:
//             page = Locations.routeName;
//             break;
//           case 3:
//             page = Profil.routeName;
//             break;
//         }
//         Navigator.pushNamedAndRemoveUntil(context, page, (route) => false,
//         );
//       },
//     );
//   }
// }
//
// class BadgeWidget extends StatelessWidget {
//   final double top;
//   final double right;
//   final Widget child;
//   final int value;
//   final Color? color;
//
//   BadgeWidget({
//     required this.child,
//     required this.value,
//     required this.top,
//     required this.right,
//     this.color,
// });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         child,
//         value == 0
//         ? Container()
//         : Positioned(
//             right: this.right,
//             top: this.top,
//             child: Container(
//               padding: EdgeInsets.all(2.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 color: this.color != null ? this.color : Colors.red),
//               child: Text(
//                 value.toString(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//
//         )
//       ],
//     );
//   }
// }