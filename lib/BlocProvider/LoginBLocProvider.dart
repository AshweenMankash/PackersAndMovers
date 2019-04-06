import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/BLoc/ShyftBloc.dart';

class ShyftBLocProvider extends InheritedWidget {
  final bloc = ShyftBLoc();

  ShyftBLocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static ShyftBLoc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ShyftBLocProvider)
            as ShyftBLocProvider)
        .bloc;
  }
}
