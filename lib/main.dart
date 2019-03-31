import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shyft',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var labelStyle = TextStyle(fontWeight: FontWeight.bold);


  Completer<GoogleMapController> _controller = Completer();

  static const  _center = const LatLng(50.0, 100.0);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.black87,
//          elevation: 0.0,
//          centerTitle: true,
//          title: Text("shyft",style: TextStyle(color: Colors.white),),
//        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
//              width: 100.0,
                child:GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 7.0,
                  ),
                  mapType: MapType.normal,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text("SHYFT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Enter Pickup Location",
                                  labelStyle: labelStyle,
                                  helperText: "Ex: Gurgaon"
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Enter Drop Location",
                                labelStyle: labelStyle,
                                helperText: "Ex: Mumbai"
                              ),
                            ),
                          )
                        ],
                      ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
