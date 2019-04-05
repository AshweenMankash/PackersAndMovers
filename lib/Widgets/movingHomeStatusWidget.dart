import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/Widgets/ConstantWidgets.dart';

class MovingHomeStatusWidget extends StatefulWidget {
  @override
  _MovingHomeStatusWidgetState createState() => _MovingHomeStatusWidgetState();
}

class _MovingHomeStatusWidgetState extends State<MovingHomeStatusWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        elevation: 5.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("LOL")
          ],
        ),
      ),
    );
  }
}
