
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miniproject/screens/intro/intro.dart';
import 'package:miniproject/selection.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {

  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) =>  Selection()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Intro()));
    }
  }

  @override
  void initState() {

    super.initState();
    // chec();
    Timer(
        Duration(seconds: 3),
            () => checkFirstSeen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 1.2),
        colors: <Color>[
          Color(0xff008080),
          Color(0xff008080),
          Color(0xff000000),


        ],
        tileMode: TileMode.repeated,
      ),
      ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo.gif"),
                    SizedBox(height: 50,),
                    Text("AI Detection Tools",style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),)

                  ],
                ),
              ),
            ),
            Align(alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: CircularProgressIndicator(
                    // color: Colors.white,
                    backgroundColor: Colors.teal,),
                ))
          ],
        ),
      ),
    );
  }
}
