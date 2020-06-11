import 'dart:convert';
import 'package:oxford3000/screens/searchbar.dart';

import '../model/dict_list.dart';
import '../model/dictmodel.dart';

import '../screens/dictonary_overview.dart';
import '../screens/list_scrool.dart';
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
      wordlist.items = _dictonary;
    });
  }

  @override
  void initState() {
    super.initState();
    loaddictfromjson();
  }

  List<Map<String, Object>> _pages = [
    {"title": "Alphabetic", "page": DictonaryOverView()},
    {"title": "ListView", "page": ListDictScreen()}
  ];
  int selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WordListModel>(context).items = dictonary;
    return Scaffold(
      appBar: AppBar(
        title: Text('Oxford 3000'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Searchbar(),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pinkAccent,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.pinkAccent,
              icon: Icon(Icons.text_format),
              title: Text("Dictonary")),
          BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.title),
              title: Text("All words")),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
      ),
      body: _pages[selectedPageIndex]["page"],
    );
  }
}
// Center(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Text('This is Oxford 3000'),
//               Text(description),
//               RaisedButton(
//                   onPressed: () {
//                     Navigator.of(context)
//                         .pushNamed(DictonaryOverView.routeName);
//                   },
//                   color: Colors.amber,
//                   child: Text('Start')),
//               RaisedButton(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed(ListDictScreen.routeName);
//                   },
//                   color: Colors.amber,
//                   child: Text('ListView')),
//             ],
//           ),
//         ),
//       ),
