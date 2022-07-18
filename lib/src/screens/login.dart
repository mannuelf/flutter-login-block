import 'package:flutter/material.dart';

import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
          ),
          passwordField(bloc),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
          ),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget emailField(Behavior bloc) {
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

  Widget passwordField(Behavior bloc) {
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

  Widget submitButton(Behavior bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
        return ElevatedButton(
            onPressed: snapshot.hasData
                ? () {
                    bloc.submit();
                  }
                : null,
            child: const Text('Login'));
      },
    );
  }
}
