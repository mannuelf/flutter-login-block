import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  build(context) {
    return MaterialApp(title: 'Log Me In', home: Scaffold(body: LoginScreen));
  }
}
