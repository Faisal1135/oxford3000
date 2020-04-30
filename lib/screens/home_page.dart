import 'dart:convert';
import '../model/dict_list.dart';
import '../model/dictmodel.dart';

import '../screens/dictonary_overview.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<DictonaryModel> dictonary = [];
  WordListModel wordlist = WordListModel();

  Future loaddictfromjson() async {
    String path = "assets/json/data.json";
    String content = await rootBundle.loadString(path);
    List jsonString = json.decode(content);
    List<DictonaryModel> _dictonary =
        jsonString.map((item) => DictonaryModel.fromJson(item)).toList();
    wordlist.items = _dictonary;
    setState(() {
      dictonary = _dictonary;
      // wordlist.items = _dictonary;
      wordlist.items = _dictonary;
    });
  }

  @override
  void initState() {
    super.initState();
    loaddictfromjson();
    // Future.delayed(Duration(seconds: 0)).then((_) {
    //   // return dictonary.map((item) =>
    //   //     Provider.of<WordListModel>(context, listen: false).addDictItem(item));
    // });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WordListModel>(context).items = dictonary;
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage '),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('This is Oxford 3000'),
              RaisedButton(
                  // onPressed: () {
                  //   Navigator.of(context).push(
                  //       MaterialPageRoute(builder: (context) => DictScreen(),));
                  // },
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(DictonaryOverView.routeName);
                  },
                  color: Colors.amber,
                  child: Text('Start'))
            ],
          ),
        ),
      ),
    );
  }
}
