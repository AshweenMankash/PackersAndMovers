import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/BLoc/ShyftBloc.dart';
import 'package:shyft_packers_and_movers/BlocProvider/LoginBLocProvider.dart';
import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';

class MovingHomeStatusWidget extends StatefulWidget {
  @override
  _MovingHomeStatusWidgetState createState() => _MovingHomeStatusWidgetState();
}

class _MovingHomeStatusWidgetState extends State<MovingHomeStatusWidget> {
  ShyftBLoc _shyftBLoc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _shyftBLoc = ShyftBLocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: _shyftBLoc.movingHomeStatusBLoc.load,
        builder: (context, snapshot) {
          return FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (context, user) {
              return !snapshot.data
                  ? Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(20.0),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance.collection("work/${user.data?.uid}/currentMoving").snapshots(),
                          builder: (context, movingData) {
                            MovingServiceModel movingServiceModel;
                            if (movingData.hasData) {
                              movingServiceModel = MovingServiceModel.fromJson(
                                  movingData.data.documents[0]);
                              return Material(
                                borderRadius: BorderRadius.circular(10.0),
                                elevation: 0.0,
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[

                                      Material(
                                        borderRadius: BorderRadius.circular(10.0),
                                        elevation: 2.0,
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.black54,),
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text("Shifting Date   "+movingServiceModel.date.day.toString()+"/"+movingServiceModel.date.month.toString()+"/"+movingServiceModel.date.year.toString(),style: TextStyle(color:Colors.white),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[

                                          Text(movingServiceModel.pickUpAddress.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20.0),semanticsLabel: "PickUpLocation",),
                                          Icon(Icons.linear_scale,color: Colors.blue,size: 50,),
                                          Text(movingServiceModel.dropAddress.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20.0),semanticsLabel: "PickUpLocation",),
                                        ],
                                      ),
                                      Divider(indent: 50,),
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                        movingServiceModel.accepted?Icon(Icons.check_circle):Container(
                                            margin: EdgeInsets.all(15.0),
                                            width: 10,
                                              height: 10,
                                            child:CircularProgressIndicator()),
                                            Text(movingServiceModel.accepted?"Request Accepted":"Your request is being processed",style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(text: TextSpan(
                                            text: "Supervisor Alloted : ",
                                            style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 15.0),
                                            children:[
                                              TextSpan(text:movingData.data.documents[0].data["SuperVisorName"].toString().toUpperCase() ,
                                                  style: TextStyle(fontWeight: FontWeight.bold))
                                            ]
                                        ),),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(text: TextSpan(
                                            text: "Survey Time : ",
                                            style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 15.0),
                                            children:[
                                              TextSpan(text:movingServiceModel.surveyTime.toUpperCase() ,
                                                  style: TextStyle(fontWeight: FontWeight.bold))
                                            ]
                                        ),),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            } else
                              return Center(
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator()),
                              );
                          }),
                    );
            }
          );
        });
  }

  Widget initialDataWidget() {}
}
