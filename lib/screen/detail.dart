import 'package:flutter/material.dart';
import 'package:oxford3000/model.dart';

class Details extends StatelessWidget {
  final DictonaryModel dictonary;
  const Details({Key key, this.dictonary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(dictonary.englishWord)),
      ),
      body: Column(
        children: <Widget>[
          Text(dictonary.englishWord),
          Text(dictonary.banglaWord),
          dictonary.meaning.isNotEmpty
              ? MeaningDisplay(
                  keys: dictonary.meaning.keys.toList(),
                  value: dictonary.meaning.values.toList(),
                )
              : Container()
        ],
      ),
    );
  }
}

class MeaningDisplay extends StatelessWidget {
  final List<String> keys;
  final List value;

  const MeaningDisplay({Key key, this.keys, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: value.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Text(keys[index]),
                Container(
                  height: 200.0,
                  child: value.length == 1
                      ? Text(value[index].first.toString())
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: value[index].length,
                          itemBuilder: (context, int ind) {
                            return Text(value[index][ind].toString());
                          }),
                )
              ],
            );
          }),
    );
  }
}
