import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/search_bloc/search_bloc.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/lang/locale_keys.g.dart';

class ClearBar extends StatelessWidget {
  const ClearBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.searched.tr(),
            style: TextStyle(
              color: MyColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<SearchBloc>(context).add(SearchCleared());
            },
            child: Text(
              LocaleKeys.clear.tr(),
              style: TextStyle(
                color: MyColors.greyText,
                fontSize: 14,
              ),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.grey.shade300),
            ),
          ),
        ],
      ),
    );
  }
}
