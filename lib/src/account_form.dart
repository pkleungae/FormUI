import 'package:flutter/material.dart';

class AccountForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountFormState();
  }
}

class AccountFormState extends State<AccountForm> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
        decoration: InputDecoration(
      labelText: 'Email Address',
      hintText: '@example.com',
    ));
  }

  passwordField() {
    return Text('Password');
  }

  submitButton() {
    return RaisedButton(
      onPressed: () {
        print('Print in rasied button');
      },
      child: Text('Button content'),
    );
  }
}
