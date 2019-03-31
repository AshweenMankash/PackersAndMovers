import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/Widgets/MovingHomesWidget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Select Service",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black54),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Moving Home",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MovingHomesWidget()));
                },
              ),
              Divider(),
              InkWell(
                enableFeedback: true,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Warehousing",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Icon(Icons.navigate_next)
                    ],
                  ),
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
