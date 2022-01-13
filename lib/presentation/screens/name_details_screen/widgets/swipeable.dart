import 'package:flutter/material.dart';

class Swipeable extends StatefulWidget {
  const Swipeable({
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
  _SwipeableState createState() => _SwipeableState();
}

class _SwipeableState extends State<Swipeable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var _dyStartPosition = 0.0;
  var _dyEndsPosition = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _controller.value = 0.4;
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
            _dyStartPosition = details.localPosition.dy;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _dyEndsPosition = details.localPosition.dy;
          });
          var widgetSize = context.size!.height;
          _controller.value = 1 - ((details.localPosition.dy) / widgetSize);
        },
        onPanEnd: (details) async {
          final delta = _dyStartPosition - _dyEndsPosition;
          final widgetSize = context.size!.height;
          final deltaNeededToBeSwiped =
              widgetSize * widget.swipePercentageNeeded;
          if (delta > deltaNeededToBeSwiped) {
            _controller.animateTo(0.4,
                duration: Duration(
                  milliseconds: 300,
                ),
                curve: Curves.fastOutSlowIn);
            widget.onSwipeCallback();
          } else {
            _controller.animateTo(0.4,
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn);
          }
        },
        child: Container(
          height: widget.height,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: _controller.value,
              child: widget.child,
            ),
          ),
        ));
  }
}
