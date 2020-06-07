import 'dart:async';
import 'package:flutter/material.dart';
import '../helpers.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();

    //redirect to homeScreen after 3 seconds
    Timer(Duration(seconds: 3),() => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {

    //get specifications of current device
    var mediaQuery = MediaQuery.of(context).size;
    return
      //use SafeArea to prevent distortions due to notch and notification bar
      SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF17172E),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                width: mediaQuery.width,
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage('assets/splash.png'),width: mediaQuery.width*0.95,),
                    UIHelpers.verticalBox(mediaQuery.height*0.02),
                    Text('COVID-19',style: UIHelpers.splashStyle(mediaQuery.height*0.09)),
                    Text('Tracker',style: UIHelpers.splashSubStyle(mediaQuery.height*0.09),),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 3,
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
