import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/names_bloc/names_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/names_lsit_tile_bloc/name_list_tile_bloc.dart';
import 'package:gozal_ismlar/data/repositories/names_repository.dart';
import 'package:gozal_ismlar/presentation/screens/landing_screen/landing_screen.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/name_details_screen.dart';

import 'business_logic/bloc/favorites_bloc/favorites_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var namesRepository = NamesRepository();

  @override
  Widget build(BuildContext context) {
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
          create: (context) => FavoritesBloc(namesRepository: namesRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Go\'zal Ismlar',
        debugShowCheckedModeBanner: false,
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingScreen(),
        /*home: NameDetailsScreen(
            filteredNames: namesRepository.getAllNames(true),
            currentNameId: 1,
          ),*/
      ),
    );
  }
}
