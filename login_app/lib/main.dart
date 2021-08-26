import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './assets/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import './SecondPage.dart';
import './signup.dart';
import './services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Login for Registered Users'),
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
  bool _obscureText = true;

  final AuthService _auth = AuthService();
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  // ignore: avoid_init_to_null
  dynamic user = null;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  _launchURLg() async {
    const url =
        'https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLt() async {
    const url = 'https://twitter.com/login/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLl() async {
    const url =
        'https://www.linkedin.com/login?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/alienware.jpg"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(40.0),

            child: ListView(
              children: <Widget>[
                Divider(
                  color: Colors.transparent,
                ),
                Divider(
                  color: Colors.transparent,
                ),
//            Image.network("https://fsb.zobj.net/crop.php?r=gFkCoiy4DWhHKzXauTWwRz3aIO4SStrIyX_GhL2P1nXvfV21wz66CvUfDI7AILYfQm5JTNaUvOGcf3QqyaJFTCzGxFSxuEk9PiTxAPXw7Lb4fYDJp2j4UOaFmAsj74LKCgUizqmKLUEAKetzok5AnKOqfHMJNuCm0ZFANfEEXP34SLLkob6FrW7EhzI"),

                InkWell(
                    onTap: () {},
                    child: Theme(
                      data: ThemeData(hintColor: Colors.amber),
                      child: TextField(
                        controller: _email,
                        style: TextStyle(color: Colors.white),
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black54,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal)),
                            hintText: 'Enter your registered Email here...',
                            labelText: 'Registered Email account',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                    )),

                Divider(
                  color: Colors.transparent,
                ),

                InkWell(
                    onTap: () {},
                    child: Theme(
                      data: ThemeData(hintColor: Colors.amber),
                      child: TextField(
                        controller: _pass,
                        style: TextStyle(color: Colors.white),
                        obscureText: _obscureText,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black54,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.teal)),
                            hintText: 'Enter your password here...',
                            labelText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                    )),
                Divider(
                  color: Colors.transparent,
                ),
                TextButton(
                    onPressed: _toggle,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                        textStyle: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold
                        )),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(_obscureText ? "Show" : "Hide"),
                          Icon(_obscureText
                              ? Icons.lock_open
                              : Icons.lock_outline),
                        ])),

                Divider(
                  color: Colors.transparent,
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Divider(
                  color: Colors.transparent,
                ),

                Row(
                  children: <Widget>[],
                ),

                Divider(
                  color: Colors.transparent,
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Divider(
                  color: Colors.transparent,
                ),

                ElevatedButton(
                  onPressed: () async {
                    user = await _auth.signIn(_email.text, _pass.text);
                    if (user != null) {
                      // signed in
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExampleApp()),
                        );
                        Fluttertoast.showToast(
                          msg: "Welcome Back!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.teal,
                          textColor: Colors.amber,
                          fontSize: 18.0,
                        );
                      });
                    } else {
                      Fluttertoast.showToast(
                        msg: "User not valid!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 20.0,
                      );
                    }
                  },
                  child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        onPrimary: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                        textStyle: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold
                        ))
                ),

                Divider(
                  color: Colors.transparent,
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        onPrimary: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                        textStyle: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold
                        )),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Sign Up'),
                          Icon(Icons.face),
                        ])),

                Divider(
                  color: Colors.transparent,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: "btn1",
                      onPressed: _launchURLg,
                      tooltip: 'Login using Google Account',
                      child: Icon(MyFlutterApp.google),
                    ),
                    FloatingActionButton(
                      heroTag: "btn2",
                      onPressed: _launchURLt,
                      tooltip: 'Login using Twitter Account',
                      child: Icon(MyFlutterApp.twitter),
                    ),
                    FloatingActionButton(
                      heroTag: "btn3",
                      onPressed: _launchURLl,
                      tooltip: 'Login using LinkedIn Account',
                      child: Icon(MyFlutterApp.linkedin_squared),
                    ),
                    FloatingActionButton(
                      heroTag: "btn4",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExampleApp()),
                        );
                      },
                      tooltip: 'Skip/Continue as Guest',
                      child: Icon(Icons.library_music),
                    ),
                  ],
                ),
              ],
            ),

            // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ),
      ),
    );
  }
}
