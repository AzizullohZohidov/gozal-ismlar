import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Text(
                'Инфо',
                style: TextStyle(
                  color: MyColors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
