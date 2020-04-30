import '../model/dict_list.dart';
import '../screens/dictonary_details.dart';
import '../screens/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DictScreen extends StatelessWidget {
  static String routeName = "/dictonary-Screen";
  const DictScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final q = ModalRoute.of(context).settings.arguments as String;
    // final wordlist = arg.last as WordListModel;
    final dictlist =
        Provider.of<WordListModel>(context, listen: false).fetchByAlpha(q);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dictonary'),
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
      body: Container(
        // height: MediaQuery.of(context).size.height * 0.7,
        child: ListView.separated(
          itemCount: dictlist.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                  DictonaryDetailsScreen.routeName,
                  arguments: dictlist[index]),
              leading: CircleAvatar(
                child: FittedBox(
                  child: Text(dictlist[index].partsOfSpeech[0]),
                ), //Text(dictonary[index].englishWord[0].toUpperCase()),
                radius: 25,
              ),
              title: Text(dictlist[index].englishWord),
              subtitle: Text(dictlist[index].banglaWord),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
