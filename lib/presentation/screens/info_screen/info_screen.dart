import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(text: 'Инфо'),
            RichText(
              text: TextSpan(
                text: 'Ushbu mobil ilova ustoz Ziyovuddin Rahimning "Go\'zal ismlar ma\'nosi" kitobi asosida tayyorlab chiqildi!\n\n' +
                    'Boshqa ism ilovalaridan farqi - barcha ismlar chiroyli va ma\'noli musulmonlarga mos ismlardan tashkil topgan.\n\n' +
                    'Ilovada imloviy yoki texnika xatoga duch kelsangiz, telegram orqali ',
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
                  const TextSpan(
                    text: ' ga murojaat qilishingizni so\'raymiz!\n\n' +
                        'Duolaringizdan umidvormiz!',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
