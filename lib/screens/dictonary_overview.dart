import '../widgets/dict_container.dart';

import '../database/alpha_lower.dart';
import 'package:flutter/material.dart';

class DictonaryOverView extends StatelessWidget {
  static const routeName = "/dictonary-overview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          padding: const EdgeInsets.all(15),
          children: alpha
              .map((char) => DictAlpha(
                    title: char,
                  ))
              .toList(),
        ));
  }
}
