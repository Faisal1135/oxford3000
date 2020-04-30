import './model/dict_list.dart';
import './screens/dict_screen.dart';
import './screens/dictonary_details.dart';
import './screens/dictonary_overview.dart';

import 'package:provider/provider.dart';

import './screens/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: WordListModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
              ),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => Homepage(),
          DictScreen.routeName: (context) => DictScreen(),
          DictonaryOverView.routeName: (context) => DictonaryOverView(),
          DictonaryDetailsScreen.routeName: (context) =>
              DictonaryDetailsScreen(),
        },
      ),
    );
  }
}
