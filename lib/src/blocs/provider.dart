import 'package:flutter/cupertino.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({Key key, Widget child}) : super(key: key, child: child);

  final bloc = Bloc();
  //always return true _means no specific  argument
  bool updateShouldNotify(_) => true;

  // this function called for looking for root context
  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().bloc;
  }
}
