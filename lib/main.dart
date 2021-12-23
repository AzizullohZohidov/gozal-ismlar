import 'package:flutter/material.dart';
import 'package:gozal_ismlar/data/repositories/names_repository.dart';
import 'package:gozal_ismlar/presentation/screens/landing_screen/landing_screen.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/name_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var names = NamesRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go\'zal Ismlar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LandingScreen(),
      home: NameDetailsScreen(
        filteredNames: names.getAllNames(true),
        currentNameId: 1,
      ),
    );
  }
}
