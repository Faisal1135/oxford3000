import '../model/dictmodel.dart';
import 'package:flutter/foundation.dart';

class WordListModel extends ChangeNotifier {
  List<DictonaryModel> items = [];

  List<DictonaryModel> get allDictItem => [...items];
  List<DictonaryModel> fetchByAlpha(String q) => items
      .where(
        (item) => item.englishWord.startsWith(
          q.toLowerCase(),
        ),
      )
      .toList();

  addDictItem(DictonaryModel dict) => items.add(dict);
}
