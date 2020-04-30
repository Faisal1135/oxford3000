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
    return InkWell(
      onTap: () => showWordOfAlpha(context),
      splashColor: Colors.amber,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: kgridViewInnerTextStyle,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple.withOpacity(0.6), Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
