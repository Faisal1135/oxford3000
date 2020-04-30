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
        title: Text('Title'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                  text: dictonary.englishWord.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: dictonary.englishWord.substring(1))
                  ]),
            ),
            // RichText(
            //   text: TextSpan(children: [
            //     TextSpan(
            //       text: dictonary.englishWord.substring(1, 2),
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //     TextSpan(
            //       text: dictonary.englishWord.substring(1),
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     )
            //   ]),
            // ),

            Container(
              child: FittedBox(child: Text(dictonary.banglaWord)),
              margin: const EdgeInsets.all(10),
            ),

            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.75,
                child: ListView.builder(
                  itemCount: dictonary.meaning.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: <Widget>[
                        Container(
                          child: Text(dictonary.partsOfSpeech[i]),
                        ),
                        Divider(),
                        buildMeaning(
                            mean: dictonary.meaningList[i], context: context)
                        // Container(
                        //   child: Text(dictonary.meaningList[i].toString()),
                        // ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildMeaning({List mean, BuildContext context}) {
  try {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            itemCount: mean.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Text(mean[index]),
                  Divider(),
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
