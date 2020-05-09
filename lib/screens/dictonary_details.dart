import '../model/dictmodel.dart';
import 'package:flutter/material.dart';

class DictonaryDetailsScreen extends StatelessWidget {
  static const routeName = "/dictonary-detail-Screen";
  const DictonaryDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictonary =
        ModalRoute.of(context).settings.arguments as DictonaryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(dictonary.englishWord),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: RichText(
              text: TextSpan(
                  text: dictonary.englishWord.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: dictonary.englishWord.substring(1)),
                  ]),
            ),
          ),
          SizedBox(height: 20),
          // Center(
          //   child: buildBn(banglaWord: dictonary.banglaWord),
          // ),
          ExpansionTile(
            title: Text("Bangla Meaning"),
            subtitle: buildBn(banglaWord: dictonary.banglaWord),
            children: <Widget>[buildBn(banglaWord: dictonary.banglaWord)],
          ),
          Column(
            children: <Widget>[...buildEnMean(dictonary.meaning)],
          )
        ],
      ),
    );
  }

  buildBn({List banglaWord}) {
    try {
      return Wrap(
          children: banglaWord.map((bn) => Text(bn.toString())).toList());
    } catch (e) {
      return Text(e.toString());
    }
  }

  buildEnMean(Map meaning) {
    List<Widget> widlist = [];
    meaning.forEach((key, value) {
      var meanList = List<String>.from(value);
      Widget newExpan = ExpansionTile(title: Text(key), children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: meanList
              .map((e) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Wrap(
                      children: <Widget>[
                        Icon(Icons.ac_unit),
                        Container(
                          child: Text(
                            e.trim(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        )
      ]);
      widlist.add(newExpan);
    });

    return widlist;
  }
}

Widget buildMeaning({List mean, BuildContext context}) {
  try {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: mean.length,
            itemBuilder: (BuildContext context, int index) {
              return Wrap(
                children: <Widget>[
                  Text(mean[index]),
                  // Divider(),
                ],
              );
            },
          ),
        ),
      ],
    );
  } catch (e) {
    return Container(
      child: Text(mean.toString()),
    );
  }
}
