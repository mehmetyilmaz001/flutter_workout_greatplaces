import 'package:flutter/widgets.dart';
import 'package:flutter_workout_greateplaces/models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

}