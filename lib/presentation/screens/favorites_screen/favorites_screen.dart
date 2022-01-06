import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/bloc/favorites_bloc/favorites_bloc.dart';
import '../common_widgets/page_title.dart';
import '../names_screen/widgets/names_list.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  late FavoritesBloc favoritesBloc;
  final ScrollController _listController = ScrollController();

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    widget.favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    widget.favoritesBloc.add(FavoritesInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageTitle(
            text: 'Сараланган',
            horizontalPadding: MediaQuery.of(context).size.width * 0.04,
          ),
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              if (state is FavoritesInitializing) {
                return Expanded(
                  child: NamesList(
                    names: state.favoriteNames,
                    listItemHeight: MediaQuery.of(context).size.height * 0.11,
                    isReversed: state.isReversed,
                  ),
                );
              } else {
                return Expanded(
                  child: NamesList(
                    names: const [],
                    listItemHeight: MediaQuery.of(context).size.height * 0.11,
                    isReversed: false,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
