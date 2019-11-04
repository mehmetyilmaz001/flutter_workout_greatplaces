import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_workout_greateplaces/helpers/db_helper.dart';
import 'package:flutter_workout_greateplaces/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: image,
        title: title,
        location: null);

    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> getPlaces() async {
    final list = await DBHelper.getData('places');
    list
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null))
        .toList();

    notifyListeners();
  }
}
