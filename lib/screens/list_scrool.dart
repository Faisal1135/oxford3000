import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oxford3000/model/dict_list.dart';
import 'package:oxford3000/model/dictmodel.dart';
import 'package:provider/provider.dart';

class ListDictScreen extends StatelessWidget {
  static const routeName = "/list-screen";
  const ListDictScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictonary = Provider.of<WordListModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Oxford 3000'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 500,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.amber)),
              child: ListWheelScrollView(
                itemExtent: 80,
                children: dictonary.allDictItem
                    .map((dict) => MyItem(
                          enword: dict.englishWord,
                          bnword: dict.banglaWord[0],
                          partsOfSpeech: dict.partsOfSpeech[0],
                        ))
                    .toList(),
              ),
            )
          ],
        ));
  }
}

class MyItem extends StatelessWidget {
  final String enword;
  final String bnword;
  final String partsOfSpeech;

  MyItem(
      {@required this.enword,
      Key key,
      @required this.bnword,
      this.partsOfSpeech})
      : super(key: key);

  static const colors = [
    Colors.pink,
    Colors.grey,
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    final Color color = colors[Random.secure().nextInt(colors.length - 1)];
    return AspectRatio(
      aspectRatio: 3,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.5), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
          child: Card(
            color: color.withOpacity(0.45),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: FittedBox(
                  child: Text(partsOfSpeech),
                ),
              ),
              title: Text(
                enword,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Container(
                  child: Text(
                bnword,
                style: TextStyle(color: Colors.white),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              )),
            ),
          )),
    );
  }
}

// Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               CircleAvatar(
//                 child: FittedBox(child: Text(partsOfSpeech)),
//                 backgroundColor: Colors.purple,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.3,
//                 child: Text(
//                   enword,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Text(bnword),
//                 width: MediaQuery.of(context).size.height * 0.1,
//               ),
//             ],
//           ),
//         ),
