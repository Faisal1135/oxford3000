import 'dart:convert' show json;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oxford3000/screen/detail.dart';
import './model.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Oxford 3000'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DictonaryModel> dictonary = [];

  Future loaddictfromjson() async {
    String path = "json/data.json";
    String content = await rootBundle.loadString(path);
    List jsonString = json.decode(content);
    List<DictonaryModel> _dictonary =
        jsonString.map((item) => DictonaryModel.fromJson(item)).toList();

    setState(() {
      dictonary = _dictonary;
    });
  }

  @override
  void initState() {
    super.initState();
    loaddictfromjson();
  }

  String getpartsOfSpeech(int index) {
    String parts;
    if (dictonary[index].meaning.isNotEmpty) {
      parts = dictonary[index].meaning.keys.first;
    } else {
      parts = "No parts";
    }
    return parts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Oxford300',
            style: Theme.of(context).textTheme.display2,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: dictonary.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    dictonary[index].englishWord,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  subtitle: Text(
                    dictonary[index].banglaWord,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  leading: CircleAvatar(
                    child: Text(getpartsOfSpeech(index)),
                    backgroundColor: Colors.blue,
                    radius: 40.0,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          dictonary: dictonary[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
