import 'package:flutter/material.dart';

class PickDropWidget extends StatefulWidget {
  final title;

  const PickDropWidget({Key key, this.title}) : super(key: key);
  @override
  _PickDropWidgetState createState() => _PickDropWidgetState();
}

class _PickDropWidgetState extends State<PickDropWidget> {
  var labelStyle =
  TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.normal,fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left:15.0,right:15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: this.widget.title,
                        labelStyle: labelStyle,
                        helperText: "Ex: House No.8, West Delhi, Delhi"),
                  ),
                ),
              ],
            ))
      ],
    );
     }
}
