import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/lang_bloc/lang_bloc.dart';
import 'package:gozal_ismlar/lang/locale_keys.g.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/widgets/letters_list.dart';
import '../../../business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import '../../../business_logic/bloc/names_bloc/names_bloc.dart';
import '../../../core/constants/my_colors.dart';
import '../../../data/models/name_model.dart';
import 'widgets/character_indicator.dart';
import 'widgets/names_list.dart';

class NamesScreen extends StatefulWidget {
  NamesScreen({Key? key}) : super(key: key);
  bool maleNamesFilter = true;
  late NamesBloc namesBloc;
  TextEditingController _searchBarController = TextEditingController();

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      BlocProvider.of<CharacterIndicatorBloc>(context)
          .add(CharacterIndicatorLetterChanged(newLetter: 'А'));
    });
    widget.namesBloc = BlocProvider.of<NamesBloc>(context);
    widget.namesBloc.add(NamesInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LangBloc, LangState>(
      listener: (context, state) {
        if (state is LangChanging) {
          setState(() {});
        }
      },
      child: Scaffold(
        body: _buildMaleFemaleTabBar(),
      ),
    );
  }

  Widget _buildMaleFemaleTabBar() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16.0,
          ),
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: MyColors.tabBar,
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            border: Border.all(color: MyColors.grey),
          ),
          child: TabBar(
            controller: _tabController,
            // give the indicator a decoration (color and border radius)
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  MyColors.darkGreen,
                  MyColors.lightGreen,
                ],
              ),
            ),
            indicatorPadding: const EdgeInsets.only(
              top: 2,
              bottom: 2,
              left: 2,
              right: 2,
            ),

            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: LocaleKeys.male_names.tr(),
              ),
              Tab(
                text: LocaleKeys.female_names.tr(),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<NamesBloc, NamesState>(
            builder: (context, state) {
              if (state is NamesInitializing) {
                return _buildNamesList(
                  state.maleNames,
                  state.femaleNames,
                  state.isReversed,
                );
              } else if (state is NamesSettingAlphabet) {
                return _buildCategoryLettersList();
              } else if (state is NamesFilteredByLetter) {
                return _buildNamesList(
                  state.filteredMaleNames,
                  state.filteredFemaleNames,
                  state.isReversed,
                );
              }
              return _buildEmptyNamesList();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNamesList(
    List<NameModel> maleNames,
    List<NameModel> femaleNames,
    bool isReversed,
  ) {
    return TabBarView(
      controller: _tabController,
      children: [
        // first tab bar view widget
        Column(
          children: [
            CharacterIndicator(),
            Expanded(
                child: NamesList(
              names: maleNames,
              listItemHeight: MediaQuery.of(context).size.height * 0.11,
              isReversed: isReversed,
            )),
          ],
        ),

        // second tab bar view widget
        Column(
          children: [
            CharacterIndicator(),
            Expanded(
                child: NamesList(
              names: femaleNames,
              listItemHeight: MediaQuery.of(context).size.height * 0.11,
              isReversed: isReversed,
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryLettersList() {
    return TabBarView(
      controller: _tabController,
      children: [
        // first tab bar view widget
        Column(
          children: [
            CharacterIndicator(),
            Expanded(
              child: LettersList(),
            ),
          ],
        ),

        // second tab bar view widget
        Column(
          children: [
            CharacterIndicator(),
            Expanded(
              child: LettersList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmptyNamesList() {
    return TabBarView(
      controller: _tabController,
      children: [
        // first tab bar view widget
        Column(
          children: [
            CharacterIndicator(),
          ],
        ),

        // second tab bar view widget
        Column(
          children: [
            CharacterIndicator(),
          ],
        ),
      ],
    );
  }

  void onTabChanged() {
    var characterIndicatorBloc =
        BlocProvider.of<CharacterIndicatorBloc>(context);
    characterIndicatorBloc.add(CharacterIndicatorLetterChanged(newLetter: 'A'));
  }
}
