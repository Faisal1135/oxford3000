import '../model/dict_list.dart';
import '../screens/dictonary_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Searchbar extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // implement buildSuggestions
    final searchlist = Provider.of<WordListModel>(context, listen: false)
        .allDictItem
        .where((s) => s.englishWord.startsWith(query))
        .toList();

    return ListView.builder(
      itemCount: searchlist.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(DictonaryDetailsScreen.routeName,
                arguments: searchlist[index]);
          },
          leading: Icon(Icons.text_fields),
          title: RichText(
            text: TextSpan(
              text: searchlist[index].englishWord.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: searchlist[index].englishWord.substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
        );
      },
    );
  }
}
