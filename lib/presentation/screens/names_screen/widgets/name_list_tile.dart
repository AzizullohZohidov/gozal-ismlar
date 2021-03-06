import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/search_bloc/search_bloc.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/name_details_screen.dart';
import '../../../../business_logic/bloc/names_lsit_tile_bloc/name_list_tile_bloc.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../data/models/name_model.dart';

class NameListTile extends StatefulWidget {
  NameListTile({
    Key? key,
    required this.id,
    required this.isReversed,
    required this.title,
    required this.subTitle,
    required this.filteredNames,
    required this.listTileHeight,
    this.isFavorite = false,
    this.fontSize = 22,
    this.iconSize = 35,
    this.saveInSearched = false,
  }) : super(key: key);
  final int id;
  final bool isReversed;
  final String title;
  final String subTitle;
  bool isFavorite;
  double fontSize;
  double iconSize;
  double listTileHeight;
  List<NameModel> filteredNames;
  late NameListTileBloc nameListTileBloc;
  final bool saveInSearched;

  @override
  State<NameListTile> createState() => _NameListTileState();
}

class _NameListTileState extends State<NameListTile> {
  @override
  void initState() {
    widget.nameListTileBloc = BlocProvider.of<NameListTileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NameListTileBloc, NameListTileState>(
      listenWhen: (previous, current) {
        if (previous != current) {
          return true;
        } else if (current is NameListTileEnteringDetails &&
            current.id == widget.id) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is NameListTileMarkingFavorite && state.id == widget.id) {
          widget.isFavorite = true;
        } else if (state is NameListTileUnmarkingFavorite &&
            state.id == widget.id) {
          widget.isFavorite = false;
        } else if (state is NameListTileEnteringDetails &&
            state.key == widget.key) {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => NameDetailsScreen(
                filteredNames: widget.filteredNames,
                currentNameId: widget.id,
              ),
            ),
          );
        }
        /*
        else if (state is NameListTileEnteringDetails &&
            state.id == widget.id) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => NameDetailsScreen(
                filteredNames: widget.filteredNames,
                currentNameId: widget.id,
              ),
            ),
          );
        }
        */
      },
      child: SizedBox(
        height: widget.listTileHeight,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                if (widget.saveInSearched) {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchSaveSearched(name: widget.title));
                }
                widget.nameListTileBloc =
                    BlocProvider.of<NameListTileBloc>(context);
                widget.nameListTileBloc.add(
                  NameListTileEnteredDetails(
                    id: widget.id,
                    key: widget.key!,
                  ),
                );
              },
              title: Text(
                !widget.isReversed ? widget.title : widget.subTitle,
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle:
                  Text(widget.isReversed ? widget.title : widget.subTitle),
              trailing: BlocBuilder<NameListTileBloc, NameListTileState>(
                buildWhen: (previous, current) {
                  if (current is NameListTileMarkingFavorite &&
                      current.id == widget.id) {
                    return true;
                  } else if (current is NameListTileUnmarkingFavorite &&
                      current.id == widget.id) {
                    return true;
                  } else if (previous != current) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      widget.nameListTileBloc =
                          BlocProvider.of<NameListTileBloc>(context);
                      if (widget.isFavorite) {
                        widget.nameListTileBloc
                            .add(NameListTileUnmarkedFavorite(id: widget.id));
                      } else {
                        widget.nameListTileBloc
                            .add(NameListTileMarkedFavorite(id: widget.id));
                      }
                    },
                    icon: widget.isFavorite
                        ? _buildSizedIcon('assets/icons/tanlangan.png', 22)
                        : _buildSizedIcon('assets/icons/tanlanmagan.png', 22),
                  );
                },
              ),
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
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
