import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/names_bloc/names_bloc.dart';
import '../../../../business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import '../../../../core/constants/my_colors.dart';

class CharacterIndicator extends StatelessWidget {
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
  bool isStatusIndicator = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamesBloc, NamesState>(
      builder: (context, state) {
        if (state is NamesSettingAlphabet) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<NamesBloc>(context).add(NamesInitialized());
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.055,
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              margin: EdgeInsets.symmetric(
                vertical: verticalMargin,
                horizontal: horizontalMargin,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.characterIndicatorColor,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Алифбо буйича',
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
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            margin: EdgeInsets.symmetric(
              vertical: verticalMargin,
              horizontal: horizontalMargin,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyColors.characterIndicatorColor,
              borderRadius: BorderRadius.circular(radius),
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
