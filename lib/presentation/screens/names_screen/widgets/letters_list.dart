import 'package:flutter/material.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/widgets/letter_tile.dart';

class LettersList extends StatelessWidget {
  LettersList({Key? key}) : super(key: key);
  List<String> letters = [
    'А',
    'Б',
    'В',
    'Г',
    'Д',
    'Е',
    'Ё',
    'Ж',
    'З',
    'И',
    'Й',
    'К',
    'Л',
    'М',
    'Н',
    'О',
    'П',
    'Р',
    'С',
    'Т',
    'У',
    'Ф',
    'Х',
    'Ц',
    'Ч',
    'Ш',
    'Э',
    'Ю',
    'Я',
    'Ў',
    'Қ',
    'Ғ',
    'Ҳ',
  ];

  @override
  Widget build(BuildContext context) {
    double tileHeight = MediaQuery.of(context).size.height * 0.11;
    return ListView.builder(
        itemCount: letters.length,
        itemBuilder: (BuildContext context, int index) {
          return LetterTile(
            letter: letters[index],
            tileHeight: tileHeight,
          );
        });
  }
}
