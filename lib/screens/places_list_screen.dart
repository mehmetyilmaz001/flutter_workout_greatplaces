import 'package:flutter/material.dart';
import 'package:flutter_workout_greateplaces/providers/great_places.dart';
import 'package:flutter_workout_greateplaces/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false).getPlaces(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: Center(
                        child: Text('Start adding some places'),
                      ),
                      builder: (ctx, greatPlaces, ch) =>
                          greatPlaces.items.length <= 0
                              ? ch
                              : ListView.builder(
                                  itemCount: greatPlaces.items.length,
                                  itemBuilder: (ctx, i) => ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          FileImage(greatPlaces.items[i].image),
                                    ),
                                    title: Text(greatPlaces.items[i].title),
                                    onTap: () {
                                      // GO detail
                                    },
                                  ),
                                ),
                    ),
        ));
  }
}
