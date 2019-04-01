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
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height*0.8,
          padding: EdgeInsets.all(20.0),
          color: Colors.white,
          child: Material(
            color: Colors.white,
            shape: SuperellipseShape(borderRadius: BorderRadius.circular(50.0)),
            elevation: 2.0,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
//                    Container(
//                      alignment: Alignment.center,
//                      width: MediaQuery.of(context).size.width,
//                      color: Colors.black,
//                      padding: const EdgeInsets.all(20.0),
//                      child: Text("Call for Movers:",style: TextStyle(color:Colors.white,fontStyle: FontStyle.normal,fontSize: 20.0,fontWeight: FontWeight.w300),),
//                    ),
                     PickDropWidget(title: "Pick Up Address",),
                     PickDropWidget(title: "Drop Address",) ,
                    InkWell(onTap: ()=>showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now().subtract(Duration(seconds: 1)), lastDate: DateTime.now().add(Duration(days: 31)))
                    ,child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text("Date",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),
                          ),
                          Flex(

                            children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: TextField(decoration: InputDecoration(labelText: "DD"),enabled: false,),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: TextField(decoration: InputDecoration(labelText: "MM"),enabled: false),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: TextField(decoration: InputDecoration(labelText: "YY"),enabled: false),
                              ),
                            ),
                          ], direction: Axis.horizontal,),
                        ],
                      ),
                    ),),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left:10.0),
                           child: Text("Select a good time for survey?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               FlatButton(onPressed: (){}, child: Text("Morning"),shape: StadiumBorder(side: BorderSide(color: Colors.blue,width: 2.0)),),
                               FlatButton(onPressed: (){}, child: Text("Afternoon"),shape: StadiumBorder(side: BorderSide(color: Colors.blue,width: 2.0)),),
                               FlatButton(onPressed: (){}, child: Text("Evening"),shape: StadiumBorder(side: BorderSide(color: Colors.blue,width: 2.0)),)
                             ],
                           ),
                         ),
                       ],
                     )
                  ],
                ),
                LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  value: 0.1 * progress,
                )

              ],
            ),
          ),
        ),floatingActionButton: FloatingActionButton.extended(onPressed: (){}, icon: Icon(Icons.check), label: Text("Request Movers")),
      ),
    );
  }
}
