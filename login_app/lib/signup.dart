import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapp/main.dart';
import './SecondPage.dart';

typedef void OnError(Exception exception);

void main() {
  runApp(new MaterialApp(
      title: 'Sign Up Page',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new SignUp()));
}


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _passc = new TextEditingController();

  dynamic user = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Sign Up for New Users'),
      ),
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/alienware.jpg"),
              fit: BoxFit.cover,
            )),
        padding: EdgeInsets.all(40.0),
        child: ListView(
          children: <Widget>[

        Image.asset('assets/images/skull.png',
            height: 250,
            fit: BoxFit.fill,
            ),

            Divider(color: Colors.transparent,),


            InkWell(
            onTap: (){},
        child: Theme(
          data: ThemeData(
              hintColor: Colors.amber
          ),
          child: TextField(
              controller: _name,
            style: TextStyle(color: Colors.white),
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.center,
            maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1,color: Colors.teal)
                  ),
                  hintText: 'Enter your username here...',
                  labelText: 'Username',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),
        )),
            Divider(color: Colors.transparent,),

    InkWell(
    onTap: (){},
    child: Theme(
    data: ThemeData(
    hintColor: Colors.amber
    ),
    child:TextField(
              controller: _email,
      style: TextStyle(color: Colors.white),
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1,color: Colors.teal)
                  ),
                  hintText: 'Enter your Email here...',
                  labelText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),
    )),
            Divider(color: Colors.transparent,),

    InkWell(
    onTap: (){},
    child: Theme(
    data: ThemeData(
    hintColor: Colors.amber
    ),
    child: TextField(
              controller: _pass,
      style: TextStyle(color: Colors.white),
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      maxLines: 1,
              obscureText: true,
              decoration:InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1,color: Colors.teal)
                  ),
                  hintText: 'Enter your password here...',
                  labelText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),
    )),
            Divider(color: Colors.transparent,),

    InkWell(
    onTap: (){},
    child: Theme(
    data: ThemeData(
    hintColor: Colors.amber
    ),
    child:  TextField(
              controller: _passc,
      style: TextStyle(color: Colors.white),
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      maxLines: 1,
              obscureText: true,
              decoration:InputDecoration(
                  filled: true,
                  fillColor: Colors.white12,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1,color: Colors.teal)
                  ),
                  hintText: 'Re-enter the same Password ...',
                  labelText: 'Confirm Password',
                  hintStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),
    )),
            Divider(color: Colors.transparent,),

            RaisedButton(
              padding: const EdgeInsets.all(25.0),
              textColor: Colors.amber,
              color: Colors.transparent,
              child: Text("SignUp"),
              onPressed: () async {
                if(_pass.text==_passc.text) {
                  user = await _auth.signUp(_name.text, _email.text, _pass.text);
                }
                if (user != null) {
                  // signed in
                  Future.delayed(Duration(seconds: 2),(){
                    Navigator.push(
                      context,

                      MaterialPageRoute(builder: (context) => ExampleApp()),

                    );
                    Fluttertoast.showToast(
                      msg: "Registration successful!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.teal,
                      textColor: Colors.amber,
                      fontSize: 16.0,
                    );
                  });
                }
                else {
                  Fluttertoast.showToast(
                    msg: "Registration not valid!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
            ),



            FloatingActionButton(
              heroTag: "btn6",
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              tooltip: 'Back to Login',
              child: Icon(Icons.arrow_back_ios),
            ),

          ],
        ),
      ),),
    );
  }



}