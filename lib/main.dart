import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wiredash/wiredash.dart';
import 'package:palindromeApp/textwidget.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: "palindromapp-bs8cw2x",
        secret: "f2419yqs2orx373ow0y7xq4j8713h9o9",
        navigatorKey: _navigatorKey,
        child: MaterialApp(
          title: 'Palandrom_Wirdash app',
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nerd = '\u{1F913}';
  String cry = '\u{1F61F}';
  String angry = '\u{1F620}';
  String wonder = '\u{1F9D0}';

  TextEditingController pal = TextEditingController();

  bool isPalindrome(String str) {
    String s = str.toLowerCase().replaceAll(RegExp(r'[\W_]'), '0');
    return s == s.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(children: [
        SizedBox(
          height: 20,
        ),
        TextWidget(),
        Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: TextField(
                controller: pal,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 32),
                cursorColor: Colors.lightBlueAccent,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  hintText: "Your Palandrom word",
                  hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  alignLabelWithHint: false,
                  fillColor: Colors.white,
                  filled: true,
                ),
                textInputAction: TextInputAction.done,
              ),
            )),
        new Container(
          margin: EdgeInsets.only(top: 0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: FlatButton(
              color: Colors.white,
              autofocus: true,
              onPressed: () {
                if (pal.text == "") {
                  Alert(
                          context: context,
                          title: "Really dude " + angry + "??",
                          desc: "You must feed me a word plz !!")
                      .show();
                } else {
                  if (isPalindrome(pal.text) == true) {
                    Alert(
                            context: context,
                            title: "You done it " + nerd + "!!",
                            desc: "Your word " + pal.text + " is a palandrom")
                        .show();
                  } else if (isPalindrome(pal.text) == false) {
                    Alert(
                            context: context,
                            title: "NAAAAAAH " + cry + "!!",
                            desc:
                                "Your word " + pal.text + " is not a palandrom")
                        .show();
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text("Verify it !!",
                    style: GoogleFonts.lexendDeca(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.white)),
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Wiredash.of(context).setUserProperties(
            userEmail: 'mail@example.com',
            userId: 'custom-id',
          );
          Wiredash.of(context).show();
          print("hello");
        },
        tooltip: 'give us an opinion',
        splashColor: Colors.yellow,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add_comment,
          color: Colors.blue,
        ),
      ),
    );
  }
}
