import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  List persons = [];
  List original = [];
  TextEditingController txtQuery = new TextEditingController();

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/persons.json');
    var json = jsonDecode(jsonStr);
    persons = json;
    original = json;
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      persons = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    print(query);
    List result = [];
    persons.forEach((p) {
      var title = p["title"].toString().toLowerCase();
      if (title.contains(query)) {
        result.add(p);
      }
    });

    persons = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tutorial"),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("List view search",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: txtQuery,
                    onChanged: search,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          txtQuery.text = '';
                          search(txtQuery.text);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _listView(persons)
          ]),
    );
  }
}

Widget _listView(persons) {
  return Expanded(
    child: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          var person = persons[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(person['title'][0]),
            ),
            // onTap: () {
            //   print(person["title"]);
            //   return ListView(

            //       child: Container(
            //           height: 200,
            //           width: 200,
            //           child: Card(
            //             color: Colors.green[200],
            //             child: Center(
            //               child: Text(person["name"]),
            //             ),
            //           ),
            //         ),
            //   );

            //   // Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //         builder: (context) => BasicInfoDetail(
            //   //               infoName: infoList.elementAt(index).title,
            //   //               info: infoList[index],
            //   //             )));
            // },
            title: Text(person['title']),
            subtitle: Text("City: " + person['images']),
          );
        }),
  );
}

// class BasicInfoDetail extends StatelessWidget {
//   final String infoName;
//   final String info;

//   const BasicInfoDetail({Key key, this.infoName, this.info}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("info"), backgroundColor: Colors.green[100]),
//         body: Container(
//             child: SafeArea(
//                 child: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           children: <Widget>[
//             Container(
//               height: 100,
//               width: MediaQuery.of(context).copyWith().size.width / 1,
//               child: Text(
//                 info.title,
//                 style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green[300]),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Container(
//               height: 200,
//               width: MediaQuery.of(context).copyWith().size.width / 1,
//               child: Image(
//                 image: AssetImage(info.images),
//                 width: 450,
//                 height: 200,
//               ),
//             ),
//             Text(
//               info.description,
//               style: TextStyle(
//                 fontSize: 20,
//                 //fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ],
//         ))
//             //   child: Container(

//             //       // child: Center(
//             //       //     //  child: RaisedButton(
//             //       //     //         child: Text('Go back ${this.info.title}'),
//             //       //     //         onPressed: () {
//             //       //     //           Navigator.pop(context);
//             //       //     //         },
//             //       //     //       ),
//             //       //     ),
//             //       ),
//             // ),
//             ));
//   }
// }

