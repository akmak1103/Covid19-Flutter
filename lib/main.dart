import 'package:flutter/material.dart';
import './models/singleState.dart';
import './ui/router.dart';
import 'package:provider/provider.dart';
import './locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<StateData>(
      create: (context) => StateData(),
      child: MaterialApp(
        title: "COVID-19",
        theme: ThemeData(
          //set font family for the entire app as Montserrat
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}