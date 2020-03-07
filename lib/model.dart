class DictonaryModel {
  String englishWord;
  String banglaWord;
  Map meaning;

  DictonaryModel({this.englishWord, this.banglaWord, this.meaning});

  DictonaryModel.fromJson(Map<String, dynamic> json)
      : englishWord = json['en_word'],
        banglaWord = json['bn_word'],
        meaning = json['meaning'];
}
