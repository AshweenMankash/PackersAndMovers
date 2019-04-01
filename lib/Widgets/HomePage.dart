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
          Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/53/Les_deux_amis_ayant_aid%C3%A9_%C3%A0_l%27emm%C3%A9nagement_du_troisi%C3%A8me.jpg",fit: BoxFit.cover,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Moving Home",
                          style: TextStyle(fontSize: 25.0,color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MovingHomesWidget()));
                },
              ),

              InkWell(
                enableFeedback: true,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Image.network("https://media.defense.gov/2016/Dec/01/2001673857/600/400/0/161022-A-GP059-001.JPG",fit: BoxFit.cover,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Warehousing",
                          style: TextStyle(fontSize: 25.0,color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              )
            ], direction: Axis.vertical,
          )
        ],
      ),
    );
  }
}
