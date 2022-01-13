import 'package:flutter/material.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/widgets/swipeable.dart';

class SwipingButton extends StatelessWidget {
  /// The text that the button will display.
  final String text;

  /// The callback invoked when the button is swiped.
  final VoidCallback onSwipeCallback;

  SwipingButton({
    Key? key,
    required this.text,
    required this.onSwipeCallback,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: <Widget>[
          /*Container(
            height: 150.0,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4.0)),
          ),*/
          Swipeable(
            height: 140.0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: child,
              ),
              height: 140.0,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            onSwipeCallback: onSwipeCallback,
            swipePercentageNeeded: 0.75,
          ),
        ],
      ),
    );
  }
}
