import 'package:flutter/material.dart';

import 'screens/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  build(context) {
    return const MaterialApp(
        title: 'Log Me In', home: Scaffold(body: LoginScreen()));
  }
}
