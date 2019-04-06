import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/BLoc/ShyftBloc.dart';
import 'package:shyft_packers_and_movers/BlocProvider/LoginBLocProvider.dart';

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
                    stream: _shyftBLoc.movingHomeStatusBLoc.currentMovingData,
                    builder: (context, movingData) {
                      return movingData.hasData?Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 5.0,
                        child: Container(
                          padding: EdgeInsets.all(100.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[Text(movingData.data.documents.length>=1?movingData.data.documents[0]["pickUpAddress"]:"")],
                          ),
                        ),
                      ):Center(child: LinearProgressIndicator(),);
                    }
                  ),
                );
        });
  }
}
