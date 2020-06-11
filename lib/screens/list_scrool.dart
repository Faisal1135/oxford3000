import 'dart:math';
import 'package:flutter/material.dart';
import '../model/dict_list.dart';
import '../model/modaldata.dart';
import '../widgets/modal.dart';
import 'package:provider/provider.dart';

class ListDictScreen extends StatelessWidget {
  static const routeName = "/list-screen";
  const ListDictScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictonary = Provider.of<WordListModel>(context);
    final data = Provider.of<ModalData>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.bubble_chart),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => ModalAreaController(
                        key: UniqueKey(),
                      ));
            }),
        body: ListView(
          children: <Widget>[
            Container(
              height: 500,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.amber)),
              child: ListWheelScrollView(
                useMagnifier: true,
                magnification: data.magnification,
                diameterRatio: data.diameterRatio,
                offAxisFraction: data.offAxisFraction,
                itemExtent: 70,
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
          child: ListTile(
            leading: CircleAvatar(
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
          )),
    );
  }
}

// class ModalAreaController extends StatelessWidget {
//   const ModalAreaController({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final data = Provider.of<ModalData>(context);
//     return Column(
//       children: <Widget>[
//         Text('offAxisFraction'),
//         Slider(
//           value: data.offAxisFraction,
//           onChanged: data.changeOffAxis,
//           min: -2,
//           max: 2,
//         ),
//         Text('diameterRatio'),
//         Slider(
//           value: data.diameterRatio,
//           onChanged: data.changeDiameter,
//           min: 0.1,
//           max: 10,
//         ),
//         Text('magnification'),
//         Slider(
//           value: data.magnification,
//           onChanged: data.changeMagnification,
//           min: 1,
//           max: 3,
//         ),
//       ],
//     );
//   }
// }

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
