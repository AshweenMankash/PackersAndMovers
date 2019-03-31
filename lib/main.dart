import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shyft_packers_and_movers/Widgets/HomePage.dart';
import 'package:shyft_packers_and_movers/Widgets/PickDropWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        primarySwatch: Colors.orange,
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

  Completer<GoogleMapController> _controller = Completer();

  static const _center = const LatLng(50.0, 120.0);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
                appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 1.0,
          centerTitle: true,
          title: Text("SHYFT",style: TextStyle(color: Colors.white,letterSpacing: 2.5,fontWeight: FontWeight.bold),),
        ),

      body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: HomePageWidget(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            onTap: (selectedPage) {},
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), title: Text("Your Orders")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("Profile")),
            ]
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
