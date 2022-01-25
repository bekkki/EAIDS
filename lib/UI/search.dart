import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final Post = [
    "addis",
    "wolkite",
    "gonder",
    "mekele",
    "hawasa",
    "diredawa",
    "jima",
    "sodo",
    "bahirdar",
    "woliso",
    "nekemt",
    "harar",
    "gambela",
    "asosa"
  ];
  final recentPost = ["woliso", "nekemt", "harar", "gambela", "asosa"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        child: Card(
          color: Colors.green[200],
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentPost
        : Post.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.post_add),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
