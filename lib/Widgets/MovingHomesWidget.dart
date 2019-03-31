import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/Widgets/InfoWidgets/PickLocationInfoWidget.dart';
import 'package:shyft_packers_and_movers/Widgets/PickDropWidget.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class MovingHomesWidget extends StatefulWidget {
  @override
  _MovingHomesWidgetState createState() => _MovingHomesWidgetState();
}

class _MovingHomesWidgetState extends State<MovingHomesWidget> {
  var progress = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black87,
          elevation: 1.0,
          centerTitle: true,
          title: Text(
            "SHYFT",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                progress == 0 ? PickDropWidget() : Container(),
                progress == 0 ? InfoWidget("**Shyft can only pick up from Delhi/Ncr region") : Container(),
                progress == 1 ? InfoWidget("Enter Dates") : Container(),
                progress == 1 ? Calendar(
                        onDateSelected: (date) {},
                        showCalendarPickerIcon: false,
                        initialCalendarDateOverride: DateTime.now(),
                      )
                    : Container()
              ],
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.white,
              value: 0.1 * progress,
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text("Back"),
                    onPressed: () {
                      progress--;
                      setState(() {});
                    },
                  ),
                  FlatButton(
                    child: Text("Next"),
                    onPressed: () {
                      progress++;
                      setState(() {});
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
