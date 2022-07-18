import 'package:flutter/material.dart';

import 'screens/login.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  build(context) {
    // Provider creates a new instance of a Bloc,
    // everything beneath can access the contexts
    return Provider(
      child: const MaterialApp(
          title: 'Log Me In', home: Scaffold(body: LoginScreen())),
    );
  }
}
