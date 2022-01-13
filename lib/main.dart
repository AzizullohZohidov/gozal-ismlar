import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/lang_bloc/lang_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/search_bloc/search_bloc.dart';
import 'package:gozal_ismlar/data/data_providers/names_database.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/lang/codegen_loader.g.dart';
import 'business_logic/bloc/names_bloc/names_bloc.dart';
import 'business_logic/bloc/names_lsit_tile_bloc/name_list_tile_bloc.dart';
import 'core/constants/my_colors.dart';
import 'data/repositories/names_repository.dart';
import 'presentation/screens/landing_screen/landing_screen.dart';
import 'business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import 'business_logic/bloc/favorites_bloc/favorites_bloc.dart';
import 'business_logic/bloc/name_details_bloc/name_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('uz', 'CR'), Locale('uz', 'LAT')],
      path: 'assets/lang',
      fallbackLocale: Locale('uz', 'CR'),
      assetLoader: CodegenLoader(),
      startLocale: Locale('uz', 'CR'),
      child: MyApp(),
    ),
  );
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Image.asset(
                          'assets/icons/gozal_ismlar_logo.png',
                        ),
                      ),
                      const SizedBox(height: 150),
                      const CircularProgressIndicator()
                    ],
                  ),
                ),
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
            BlocProvider<SearchBloc>(
              create: (context) => SearchBloc(namesRepository: namesRepository),
            ),
            BlocProvider<LangBloc>(
              create: (context) => LangBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'Go\'zal Ismlar',
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: MyColors.white,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
              ),
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: LandingScreen(),
          ),
        );
      },
    );
  }
}
