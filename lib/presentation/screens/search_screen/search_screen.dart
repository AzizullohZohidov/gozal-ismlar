import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/search_bloc/search_bloc.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/presentation/screens/common_widgets/page_title.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/widgets/names_list.dart';
import 'package:gozal_ismlar/presentation/screens/search_screen/widgets/clear_bar.dart';
import 'package:gozal_ismlar/presentation/screens/search_screen/widgets/recently_searched.dart';
import 'package:gozal_ismlar/presentation/screens/search_screen/widgets/s_app_bar.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchBarController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(SearchInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          /*padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),*/
          child: Column(
            children: [
              SAppBar(
                padding: 30,
                searchBarController: searchBarController,
              ),
              const ClearBar(),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (prev, curr) {
                    if (curr is SearchEmpty) {
                      return false;
                    } else if (prev != curr) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if (state is SearchInitializing) {
                      return RecentlySearched(
                        recentlySearchedNames: state.recentlySearchedNames,
                        searchBarController: searchBarController,
                      );
                    } else if (state is SearchFiltering) {
                      return NamesList(
                        names: state.filteredNames,
                        listItemHeight:
                            MediaQuery.of(context).size.height * 0.11,
                        isReversed: false,
                      );
                    } else if (state is SearchClearing) {
                      return RecentlySearched(
                        recentlySearchedNames: [],
                        searchBarController: searchBarController,
                      );
                    }
                    return RecentlySearched(
                      recentlySearchedNames: [],
                      searchBarController: searchBarController,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
