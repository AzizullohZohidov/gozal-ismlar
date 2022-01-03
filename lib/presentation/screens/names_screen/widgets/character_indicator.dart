import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import '../../../../core/constants/my_colors.dart';

class CharacterIndicator extends StatelessWidget {
  const CharacterIndicator({
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
  Widget build(BuildContext context) {
    return Container(
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
          _buildSizedIcon('assets/icons/letter_category.png', 18),
        ],
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
