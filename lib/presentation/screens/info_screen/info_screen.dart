import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/presentation/screens/common_widgets/page_title.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

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
            Text(
              'Ushbu mobil ilova ustoz Ziyovuddin Rahimning "Go\'zal ismlar ma\'nosi" kitobi asosida tayyorlab chiqildi!\n\n' +
                  'Boshqa ism ilovalaridan farqi - barcha ismlar chiroyli va ma\'noli musulmonlarga mos ismlardan tashkil topgan.\n\n' +
                  'Ilovada imloviy yoki texnika xatoga duch kelsangiz, telegram orqali @akbarov_zohidjon ga murojaat qilishingizni so\'raymiz!\n\n' +
                  'Duolaringizdan umidvormiz!',
              style: TextStyle(
                color: MyColors.black,
                fontSize: 17,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
