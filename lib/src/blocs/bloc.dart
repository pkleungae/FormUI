import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //getter api
  //add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  // 它會取得各個 observable 最後送出的值，再輸出成一個值，我們直接看範例會比較好解釋。
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }

  submit() {
    final validEmail = _emailController.value;
    final validpPssword = _passwordController.value;
    print('Valid Email is $validEmail');
    print('Valid Password is $validpPssword');
  }
}

//create global instance of bloc
// final bloc = Bloc();
