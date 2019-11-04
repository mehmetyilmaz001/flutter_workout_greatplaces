import 'package:flutter/material.dart';
import 'package:flutter_workout_greateplaces/providers/great_places.dart';
import 'package:flutter_workout_greateplaces/screens/add_place_screen.dart';
import 'package:flutter_workout_greateplaces/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen()
        },
      ),
    );
  }
}
