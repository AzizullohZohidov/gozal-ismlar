import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/presentation/screens/common_widgets/colored_icon.dart';

class NameListTile extends StatefulWidget {
  NameListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    this.isFavorite = false,
    this.fontSize = 22,
    this.iconSize = 35,
  }) : super(key: key);
  final String title;
  final String subTitle;
  bool isFavorite;
  double fontSize;
  double iconSize;

  @override
  State<NameListTile> createState() => _NameListTileState();
}

class _NameListTileState extends State<NameListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          title: Text(
            widget.title,
            style: TextStyle(
              color: MyColors.black,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(widget.subTitle),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                widget.isFavorite = !widget.isFavorite;
              });
            },
            icon: widget.isFavorite
                ? ColoredIcon(
                    icon: Icons.star_rounded,
                    bottomLeftColor: MyColors.deepOrange,
                    topRightColor: MyColors.yellow,
                    iconSize: widget.iconSize,
                  )
                : Icon(
                    Icons.star_border_rounded,
                    size: widget.iconSize,
                  ),
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
