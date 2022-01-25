import 'package:flutter/material.dart';

// void main()=> runApp(new MyApp());
// class MyApp extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: "This is my first Flutter App",
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text("this is headers title"),
//         ),
//         body: new Center(
//             child: new Text("This is at the bodys center"),
//           ),
//         ),
//       );
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////
// void main() {
//   runApp(MyApplication());
// }

// class MyApplication extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "ለገበሬው",
//       home: Scaffold(
//         appBar: AppBar(
//             title: Center(
//           child: Text("ለገበሬው"),
//         )),
//         body: Column(
//           children: [
//             Center(
//               child: Text("Click and check bellow buttons!"),
//             ),
//             RaisedButton(
//               child: Text("Button1"),
//               onPressed: () {},
//             ),
//             RaisedButton(
//               child: Text("Button2"),
//               onPressed: () {},
//             ),
//             RaisedButton(
//               child: Text("Button3"),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         backgroundColor: Colors.grey,
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////

// void main() {
//   runApp(Belete());
// }

// class Belete extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//
//     return _BeleteState();
//   }
// }

// class _BeleteState extends State<Belete> {
//   var animalIndex = 0;
//   void animal() {
//     setState(() {
//       animalIndex = animalIndex + 1;
//     });
//   }

//   Widget build(BuildContext context) {
//     var animals = ['Caw', 'Sheep', 'Tiger', 'Lion', 'Fox', 'Zebra', 'Niyala'];
//     return MaterialApp(
//       title: "First flutter app",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("First app"),
//           backgroundColor: Colors.green,
//         ),
//         body: Column(
//           children: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.home)),
//             Text("Press the button below to get different animals!"),
//             Text(animals[animalIndex]),
//             RaisedButton(
//                 child: Text("Next"),
//                 onPressed: () {
//                     animal();
//                   })
//           ],
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////////////////////

// void main() {
//   runApp(EasyFarming());
// }

// class EasyFarming extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//
//     return EasyFarmingState();
//   }
// }

// class EasyFarmingState extends State<EasyFarming> {
//   var colorIndex = 0;
//   void color() {
//     setState(() {
//       colorIndex = colorIndex + 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var Colors = ['White', 'Black', 'Green', 'Yellow', 'Red', 'Magenta'];
//     return MaterialApp(
//       title: "EasyFarming",
//       home: Scaffold(
//       appBar: AppBar(
//         title: Text("EasyFarming"),
//       ),
//       body: Column(
//         children: [
//           Text("Press the \"Next\" button"),
//           Text(Colors[colorIndex]),
//           RaisedButton(
//             child: Text("Next"),
//             onPressed: () {
//               color();
//             },
//           )
//         ],
//       ),
//     ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////

// void main() {
//   runApp(MaterialApp(
//     title: 'Navigation Basics',
//     home: FirstRoute(),
//   ));
// }

// class FirstRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Open route'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondRoute()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
///////////////////////////////////////////////////////////////////////

