import 'package:flutter/material.dart';

import 'authentication.dart';
import '../UI/home_page.dart';

class loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ለገበሬው',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  var kBodyText;
  // var password1=authentication.password;
  // var phonenumber1=authentication.PhoneNumber;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/background2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            )),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  'EasyFarming',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.phone,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Phone Number',
                        hintStyle: kBodyText,
                      ),
                      style: kBodyText,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.lock,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                        hintStyle: kBodyText,
                      ),
                      obscureText: true,
                      obscuringCharacter: 'a',
                      style: kBodyText,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 10,
                  ),
                  // Checkbox(value: true, onChanged: null),
                  // Text('stay log'),
                  RaisedButton(
                    color: Colors.grey,
                    hoverColor: Colors.blue,
                    child: Text("login"),
                    onPressed: () {
                      //  if(phonenumber1== "1234" && password1=="belete")
                      //  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context1) => MyHomePage()),
                      );
                      // }
                      //   else{
                      //     Navigator.push(context,
                      //     MaterialPageRoute(builder: (context1) =>Belete())
                      //     );
                      //   }
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forget Password?'),
                  )
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context1) => authentication()),
                  );
                },
                child: Text('Create new account'),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// void main() async {
//   /// Create a new instance of [StreamChatClient] passing the apikey obtained from your
//   /// project dashboard.
//   final client = StreamChatClient(
//     'b67pax5b2wdq',
//     logLevel: Level.INFO,
//   );

//   /// Set the current user. In a production scenario, this should be done using
//   /// a backend to generate a user token using our server SDK.
//   /// Please see the following for more information:
//   /// https://getstream.io/chat/docs/flutter-dart/tokens_and_authentication/?language=dart
//   await client.connectUser(
//     User(id: 'tutorial-flutter'),
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
//   );

//   /// Creates a channel using the type `messaging` and `flutterdevs`.
//   /// Channels are containers for holding messages between different members. To
//   /// learn more about channels and some of our predefined types, checkout our
//   /// our channel docs: https://getstream.io/chat/docs/flutter-dart/creating_channels/?language=dart
//   final channel = client.channel('messaging', id: 'flutterdevs');

//   /// `.watch()` is used to create and listen to the channel for updates. If the
//   /// channel already exists, it will simply listen for new events.
//   channel.watch();

//   runApp(
//     MyApp(
//       client: client,
//       channel: channel,
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   /// To initialize this example, an instance of [client] and [channel] is required.
//   const MyApp({
//     Key? key,
//     required this.client,
//     required this.channel,
//   }) : super(key: key);

//   /// Instance of [StreamChatClient] we created earlier. This contains information about
//   /// our application and connection state.
//   final StreamChatClient client;

//   /// The channel we'd like to observe and participate.
//   final Channel channel;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: (context, widget) {
//         return StreamChat(
//           client: client,
//           child: widget,
//         );
//       },
//       home: StreamChannel(
//         channel: channel,
//         child: const ChannelPage(),
//       ),
//     );
//   }
// }

// /// Displays the list of messages inside the channel
// class ChannelPage extends StatelessWidget {
//   const ChannelPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const ChannelHeader(),
//       body: Column(
//         children: const <Widget>[
//           Expanded(
//             child: MessageListView(),
//           ),
//           MessageInput(),
//         ],
//       ),
//     );
//   }
// }
