import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class AccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //wired it back to the bloc we created in bloc first created
    final bloc = Provider.of(context);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 20.0)),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
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

  Widget passwordField(Bloc bloc) {
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

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      //每當stream 更新時,builder就會再行一次
      stream: bloc
          .submitValid, //如果其中一條thread 有更新(pass value),就會有return (data / error);
      builder: (context, snapshot) {
        return RaisedButton(
          //if error is passed , data is
          onPressed: snapshot.hasData
              ? () {
                  bloc.submit();
                }
              : null,
          child: Text('Button content'),
        );
      },
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
