import 'package:flutter/material.dart';

class SwipeableNextButton extends StatefulWidget {
  const SwipeableNextButton({
    Key? key,
    required this.child,
    required this.height,
    required this.onSwipeCallback,
    required this.swipePercentageNeeded,
  })  : assert(child != null &&
            onSwipeCallback != null &&
            swipePercentageNeeded <= 1.0),
        super(key: key);

  final Widget child;
  final double height;
  final VoidCallback onSwipeCallback;
  final double swipePercentageNeeded;

  @override
  _SwipeableNextButtonState createState() => _SwipeableNextButtonState();
}

class _SwipeableNextButtonState extends State<SwipeableNextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var _dxStartPosition = 0.0;
  var _dxEndsPosition = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          //_dxStartPosition = details.localPosition.dx;
          _dxStartPosition = details.localPosition.dy;
        });
      },
      onPanUpdate: (details) {
        final widgetSize = context.size!.width;

        // will only animate the swipe if user start the swipe in the quarter half start page of the widget
        final minimumXToStartSwiping = widgetSize * 0.25;
        if (_dxStartPosition <= minimumXToStartSwiping) {
          setState(() {
            _dxEndsPosition = details.localPosition.dx;
          });

          // update the animation value according to user's pan update
          final widgetSize = context.size!.width;
          _controller.value = 1 - ((details.localPosition.dx) / widgetSize);
        }
      },
      onPanEnd: (details) async {
        // checks if the right swipe that user has done is enough or not
        final delta = _dxEndsPosition - _dxStartPosition;
        final widgetSize = context.size!.width;
        final deltaNeededToBeSwiped = widgetSize * widget.swipePercentageNeeded;
        if (delta > deltaNeededToBeSwiped) {
          // if it's enough, then animate to hide them
          _controller.animateTo(
            0.0,
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
          widget.onSwipeCallback();
        } else {
          // if it's not enough, then animate it back to its full width
          _controller.animateTo(
            1.0,
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        }
      },
      child: Container(
        height: widget.height,
        child: Align(
          alignment: Alignment.centerRight,
          child: FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: _controller.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
