import 'package:gozal_ismlar/data/models/name_model.dart';

class DummyData {
  List<NameModel> names = [];
  List<String> namesInKirill = [
    'Абдулазиз',
    'Абдулазим',
    'Абдулахад',
    'Абдулборий',
    'Абдулвали',
    'Ансор',
    'Бахриддин',
    'Бекзод',
  ];
  List<String> namesInLatin = [
    'Abdulaziz',
    'Abdulazim',
    'Abdulahad',
    'Abdulboriy',
    'Abdulvali',
    'Ansor',
    'Bahriddin',
    'Bekzod',
  ];
  List<String> meanings = [
    'буюк ва қудратли Аллоҳнинг бандаси. Арабча',
    'иззат ва куч-қудрат соҳиби бўлган ғолиб Аллоҳнинг бандаси. Арабча',
    'яккаю-ягона бўлган Аллоҳнинг бандаси. Арабча',
    'йўқдан бор қилувчи, яратувчи Аллоҳнинг бандаси. Арабча',
    'дўст, мададкор Аллоҳнинг бандаси. Арабча',
    'ёрдамчи, маслакдош. Бу ерда пайғамбарга кўмакдош бўлганлар кўзда тутилади. Арабча.',
    'диннинг нури, ёғдуси, шуъласи, диннинг виқори, шукуҳи ёки диннинг нурли, эътиқодли, иймонли, саодатманд кишиси. Арабча.',
    'бек фарзанди, беклар авлодига, зотига мансуб бола. Виқорли, кучли, мард бўлсин. Ўзбекча, форс-тожикча.',
  ];
  List<String> peopleWithThisName = [
    '123',
    '456',
    '789',
    '101112',
    '131415',
    '161718',
    '192021',
    '222324',
  ];
  DummyData() {
    for (int i = 0; i < names.length; i++) {
      names.add(
        NameModel(
          id: i,
          name: namesInKirill[i],
          nameInLatin: namesInLatin[i],
          meaning: meanings[i],
          peopleWithThisName: peopleWithThisName[i],
        ),
      );
    }
  }
}
