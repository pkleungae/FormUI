import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class AccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 20.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          //return a new text widget when stream get updated
          return TextFormField(
              //when there is an change, this on changed fucntion would be called an be passed in an string
              onChanged: bloc.changeEmail,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: '@example.com',
                errorText: snapshot.error,
              ));
        });
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          //return a new text widget when stream get updated
          return TextFormField(
              //when there is an change, this on changed fucntion would be called an be passed in an string
              onChanged: bloc.changePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                errorText: snapshot.error,
              ));
        });
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        print('Print in rasied button');
      },
      child: Text('Button content'),
    );
  }
}

// extends StatelessWidget

// {
//   @override
//   State<StatefulWidget> createState() {
//     return AccountFormState();
//   }
// }

// class AccountFormState extends State<AccountForm> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       margin: EdgeInsets.all(20.0),
//       child: Form(
//         child: Column(
//           children: <Widget>[
//             emailField(),
//             passwordField(),
//             submitButton(),
//           ],
//         ),
//       ),
//     );
//   }

// Widget emailField() {
//   return TextFormField(
//       decoration: InputDecoration(
//     labelText: 'Email Address',
//     hintText: '@example.com',
//   ));
// }

//   passwordField() {
//     return Text('Password');
//   }

//   submitButton() {
//     return RaisedButton(
//       onPressed: () {
//         print('Print in rasied button');
//       },
//       child: Text('Button content'),
//     );
//   }
// }
