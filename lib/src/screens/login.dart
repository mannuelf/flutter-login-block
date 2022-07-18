import 'package:flutter/material.dart';

import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
          ),
          passwordField(),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
          ),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot<Object?> snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Add Email Address',
              errorText: snapshot.error.toString()),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: bloc.password,
        builder: ((context, AsyncSnapshot<Object?> snapshot) {
          return TextField(
            obscureText: true,
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Create a password',
                errorText: snapshot.error.toString()),
          );
        }));
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () => print('Logging in'), child: const Text('Login'));
  }
}
