import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/lang_bloc/lang_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/names_bloc/names_bloc.dart';
import 'package:gozal_ismlar/lang/locale_keys.g.dart';
import '../../../../business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import '../../../../core/constants/my_colors.dart';

class CharacterIndicator extends StatefulWidget {
  CharacterIndicator({
    Key? key,
    this.horizontalPadding = 16,
    this.verticalPadding = 0,
    this.horizontalMargin = 16,
    this.verticalMargin = 0,
    this.radius = 15,
  }) : super(key: key);
  final double horizontalPadding;
  final double verticalPadding;
  final double horizontalMargin;
  final double verticalMargin;
  final double radius;

  @override
  State<CharacterIndicator> createState() => _CharacterIndicatorState();
}

class _CharacterIndicatorState extends State<CharacterIndicator> {
  bool isStatusIndicator = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LangBloc, LangState>(
      listener: (context, state) {
        if (state is LangChanging) {
          setState(() {});
        }
      },
      child: BlocBuilder<NamesBloc, NamesState>(
        builder: (context, state) {
          if (state is NamesSettingAlphabet || state is NamesFilteredByLetter) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<NamesBloc>(context).add(NamesInitialized());
                BlocProvider.of<CharacterIndicatorBloc>(context)
                    .add(CharacterIndicatorLetterChanged(newLetter: 'А'));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.055,
                padding: EdgeInsets.symmetric(
                  vertical: widget.verticalPadding,
                  horizontal: widget.horizontalPadding,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: widget.verticalMargin,
                  horizontal: widget.horizontalMargin,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.characterIndicatorColor,
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.by_alphabet.tr(),
                      style: TextStyle(
                        color: MyColors.darkGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildSizedIcon('assets/icons/delete.png', 18),
                  ],
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              BlocProvider.of<NamesBloc>(context).add(NamesSetAlphabet());
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.055,
              padding: EdgeInsets.symmetric(
                vertical: widget.verticalPadding,
                horizontal: widget.horizontalPadding,
              ),
              margin: EdgeInsets.symmetric(
                vertical: widget.verticalMargin,
                horizontal: widget.horizontalMargin,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.characterIndicatorColor,
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLetterText(),
                  _buildSizedIcon('assets/icons/equality.png', 18),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLetterText() {
    return BlocBuilder<CharacterIndicatorBloc, CharacterIndicatorState>(
      builder: (context, state) {
        return Text(
          state is CharacterIndicatorLetterChanging ? state.newLetter : 'А',
          style: TextStyle(
            color: MyColors.darkGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }

  Widget _buildSizedIcon(String pathToIcon, double size) {
    return SizedBox(
      height: size,
      width: size,
      child: Image.asset(
        pathToIcon,
      ),
    );
  }
}
