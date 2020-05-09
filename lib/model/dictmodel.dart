import 'package:flutter/foundation.dart';

class DictonaryModel extends ChangeNotifier {
  final String englishWord;
  final List banglaWord;
  final Map meaning;
  bool isFavorite;

  DictonaryModel(
      {this.englishWord,
      this.banglaWord,
      this.meaning,
      this.isFavorite = false});

  DictonaryModel.fromJson(Map<String, dynamic> json)
      : englishWord = json['en_word'],
        banglaWord = json['bn_word'],
        meaning = json['meaning'];

  List<String> get partsOfSpeech =>
      meaning.keys.isEmpty ? ["No POS"] : meaning.keys.toList();
  List get meaningList => meaning.values.isEmpty
      ? [
          ["No meaing"],
        ]
      : meaning.values.toList();

  toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
