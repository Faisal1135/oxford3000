import 'package:oxford3000/model/dict_list.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../screens/dict_screen.dart';
import 'package:flutter/material.dart';

class DictAlpha extends StatelessWidget {
  final String title;

  const DictAlpha({Key key, this.title}) : super(key: key);

  void showWordOfAlpha(BuildContext context) {
    Navigator.of(context).pushNamed(DictScreen.routeName, arguments: title);
  }

  @override
  Widget build(BuildContext context) {
    final dictlist =
        Provider.of<WordListModel>(context, listen: false).fetchByAlpha(title);
    return InkWell(
      onTap: () => showWordOfAlpha(context),
      splashColor: Colors.amber,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: kgridViewInnerTextStyle,
              ),
              Text(
                dictlist.length.toString(),
                style: kgridViewInnerTextStyle.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink.withOpacity(0.6), Colors.amberAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
