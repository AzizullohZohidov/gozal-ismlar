import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/data/data_providers/names_database.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'business_logic/bloc/names_bloc/names_bloc.dart';
import 'business_logic/bloc/names_lsit_tile_bloc/name_list_tile_bloc.dart';
import 'core/constants/my_colors.dart';
import 'data/repositories/names_repository.dart';
import 'presentation/screens/landing_screen/landing_screen.dart';
import 'presentation/screens/name_details_screen/name_details_screen.dart';

import 'business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import 'business_logic/bloc/favorites_bloc/favorites_bloc.dart';
import 'business_logic/bloc/name_details_bloc/name_details_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var namesRepository;
  final Future<List<NameModel>> namesFuture =
      NamesDatabase.instance.readAllNames();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameModel>>(
      future: namesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text(snapshot.error.toString()),
              ),
            ),
          );
        }
        namesRepository = NamesRepository(
          allNames: snapshot.data as List<NameModel>,
        );
        return MultiBlocProvider(
          providers: [
            BlocProvider<NamesBloc>(
              create: (context) => NamesBloc(namesRepository: namesRepository),
            ),
            BlocProvider<NameListTileBloc>(
              create: (context) =>
                  NameListTileBloc(namesRepository: namesRepository),
            ),
            BlocProvider<FavoritesBloc>(
              create: (context) =>
                  FavoritesBloc(namesRepository: namesRepository),
            ),
            BlocProvider<CharacterIndicatorBloc>(
              create: (context) => CharacterIndicatorBloc(),
            ),
            BlocProvider<NameDetailsBloc>(
              create: (context) =>
                  NameDetailsBloc(namesRepository: namesRepository),
            ),
          ],
          child: MaterialApp(
            title: 'Go\'zal Ismlar',
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: MyColors.white,
            ),
            home: LandingScreen(),
          ),
        );
      },
    );
  }
}
