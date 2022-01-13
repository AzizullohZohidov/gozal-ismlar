import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/lang_bloc/lang_bloc.dart';
import 'package:gozal_ismlar/lang/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/my_colors.dart';
import '../common_widgets/page_title.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late TapGestureRecognizer _launchTapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _launchTapGestureRecognizer = TapGestureRecognizer()..onTap = _handleOnTap;
  }

  @override
  void dispose() {
    _launchTapGestureRecognizer.dispose();
    super.dispose();
  }

  void _handleOnTap() {
    launch("https://t.me/akbarov_zohidjon", forceSafariVC: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LangBloc, LangState>(
      listener: (context, state) {
        if (state is LangChanging) {
          print('Language change detected');
          setState(() {});
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(text: LocaleKeys.info.tr()),
              RichText(
                text: TextSpan(
                  text: LocaleKeys.info_content.tr(),
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 17,
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        recognizer: _launchTapGestureRecognizer,
                        text: '@akbarov_zohidjon',
                        style: TextStyle(color: MyColors.lightBlue)),
                    TextSpan(
                      text: LocaleKeys.info_content_continuation.tr(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
