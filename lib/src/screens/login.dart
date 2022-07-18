import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[emailField(), passwordField(), submitButton()],
      ),
    );
  }

  Widget emailField() {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'you@example.com', labelText: 'Add Email Address'),
    );
  }

  Widget passwordField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'Password', labelText: 'Password'),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () => print('Logging in'), child: Text('Login'));
  }
}
