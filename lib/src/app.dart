import 'package:flutter/material.dart';
import 'account_form.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Log in',
      home: Scaffold(
        body: AccountForm(),
      ),
    );
  }
}
