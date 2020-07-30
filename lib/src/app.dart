import 'package:FormUI/src/blocs/provider.dart';
import 'package:flutter/material.dart';
import 'screen/account_form.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      title: 'Log in',
      home: Scaffold(
        body: AccountForm(),
      ),
    ));
  }
}
