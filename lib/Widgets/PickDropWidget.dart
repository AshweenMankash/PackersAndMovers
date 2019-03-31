import 'package:flutter/material.dart';

class PickDropWidget extends StatefulWidget {
  @override
  _PickDropWidgetState createState() => _PickDropWidgetState();
}

class _PickDropWidgetState extends State<PickDropWidget> {
  var labelStyle =
  TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Enter Drop Location",
                        labelStyle: labelStyle,
                        helperText: "Ex: Mumbai"),
                  ),
                ),
              ],
            ))
      ],
    );
     }
}
