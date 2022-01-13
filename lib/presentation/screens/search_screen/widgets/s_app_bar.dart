import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/search_bloc/search_bloc.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';

class SAppBar extends StatelessWidget {
  SAppBar({
    Key? key,
    required this.padding,
    required this.searchBarController,
  }) : super(key: key);

  final double padding;
  final TextEditingController searchBarController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
              child: Image.asset('assets/icons/back_arrow.png'),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: TextField(
                controller: searchBarController,
                cursorColor: MyColors.grey,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(color: MyColors.greyText),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                style: const TextStyle(fontSize: 18),
                onChanged: (String text) {
                  print('From onChanged of textEditor');
                  if (text.isEmpty) {
                    print('Text is empty');
                    BlocProvider.of<SearchBloc>(context).add(
                      SearchBarEmptied(),
                    );
                    print('After adding SearchBarEmptied() event');
                  } else if (text.isNotEmpty) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchFiltered(pattern: searchBarController.text));
                  }
                },
                /*onEditingComplete: () {
                  BlocProvider.of<SearchBloc>(context).add(
                    SearchFiltered(pattern: searchBarController.text),
                  );
                },*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}
