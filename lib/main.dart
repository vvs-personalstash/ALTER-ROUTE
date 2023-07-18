import 'package:flutter/material.dart';
import 'package:maps_app/screens/intro.dart';
import 'package:maps_app/screens/login_page.dart';
import 'package:maps_app/screens/signup.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: IntroPage(),
        routes: {
        AddPlaceScreen.routeName: (ctx) =>AddPlaceScreen(),
          '/login': (ctx)=>LoginPage(),
          '/signup': (ctx)=> Signup(),
          '/placesListScreen': (ctx)=> PlacesListScreen(),
        }
    ),
    );
  }
}
