import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shyft_packers_and_movers/Model/MovingServiceModel.dart';
import 'package:shyft_packers_and_movers/Model/UiConstants.dart';
import 'package:shyft_packers_and_movers/ViewModel/MovingServiceViewModel.dart';
import 'package:shyft_packers_and_movers/ViewModel/MovingServiceViewModel.dart';
import 'package:shyft_packers_and_movers/ViewModel/MovingServiceViewModel.dart';

class MovingHomesWidget extends StatefulWidget {
  @override
  _MovingHomesWidgetState createState() => _MovingHomesWidgetState();
}

class _MovingHomesWidgetState extends State<MovingHomesWidget> {
  var progress = 0;
  MovingServiceModel model = new MovingServiceModel();
  MovingServiceViewModel controller = new MovingServiceViewModel();

  @override
  void initState() {
    super.initState();
    controller.loading.add(false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  var pickUpText = TextEditingController();
  var dropText = TextEditingController();


  onChanged() {}
  var labelStyle =
  TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.normal,fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<bool>(
          stream: controller.loading.stream,
          builder: (context, snapshot) {
            return Stack(
              children: <Widget>[
                Scaffold(
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.8,
                    padding: EdgeInsets.all(20.0),
                    color: Colors.white,
                    child: Material(
                      color: Colors.white,
                      shape: SuperellipseShape(
                          borderRadius: BorderRadius.circular(50.0)),
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
                              Column(
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

                                              onChanged: (pick){
                                                controller.movingDetails.pickUpAddress=pick;
                                                setState(() {

                                                });
                                              },
                                              decoration: InputDecoration(
                                                  labelText: UiConstants.pickUpAddress,
                                                  labelStyle: labelStyle,
                                                  helperText: UiConstants.pickUpAddressHint),
                                              controller: this.pickUpText,
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              Column(
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
                                              onChanged: (drop){
                                                controller.movingDetails.dropAddress=drop;
                                                setState(() {

                                                });
                                              },
                                              decoration: InputDecoration(
                                                  labelText: UiConstants.dropAddress,
                                                  labelStyle: labelStyle,
                                                  helperText: UiConstants.dropAddressHint),
                                              controller: this.dropText,
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              InkWell(
                                onTap: () async {
                                  controller.movingDetails?.date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now()
                                          .subtract(Duration(seconds: 1)),
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 31)));
                                  print(controller.movingDetails.date.toIso8601String());
                                        setState(() {

                                        });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          UiConstants.dateHeading,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54),
                                        ),
                                      ),
                                      Flex(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: TextField(
                                                controller:
                                                TextEditingController(
                                                    text: controller.movingDetails.date?.day
                                                        .toString() ??
                                                        ""),
                                                decoration: InputDecoration(
                                                    labelText: UiConstants.dateLabelText),
                                                enabled: false,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: TextField(
                                                  controller:
                                                  TextEditingController(
                                                      text: controller.movingDetails.date?.month
                                                          .toString() ??
                                                          ""),
                                                  decoration: InputDecoration(
                                                      labelText: UiConstants.monthLabelText),
                                                  enabled: false),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: TextField(
                                                  controller:
                                                  TextEditingController(
                                                      text: controller.movingDetails?.date
                                                          ?.year
                                                          ?.toString() ??
                                                          ""),
                                                  decoration: InputDecoration(
                                                      labelText: UiConstants.yearLabelText),
                                                  enabled: false),
                                            ),
                                          ),
                                        ],
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Text(
                                      UiConstants.surveyHeading,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            controller
                                                .movingDetails
                                                .surveyTime = UiConstants.surveyTimeOptions[0];
                                            setState(() {});
                                          },
                                          child: Text(UiConstants.surveyTimeOptions[0],
                                            style: TextStyle(
                                                color:
                                                controller.movingDetails
                                                    ?.surveyTime ==
                                                    UiConstants.surveyTimeOptions[0]
                                                    ? Colors.white
                                                    : Colors.black),),
                                          color: controller.movingDetails?.surveyTime ==
                                              UiConstants.surveyTimeOptions[0]
                                              ? Colors.blue
                                              : Colors.transparent,
                                          shape: StadiumBorder(
                                              side:BorderSide(
                                                  color: Colors.blue,
                                                  width: 2.0)),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            controller.movingDetails?.surveyTime = UiConstants.surveyTimeOptions[1];
                                            setState(() {});
                                          },
                                          color: controller.movingDetails?.surveyTime ==
                                              UiConstants.surveyTimeOptions[1]
                                        ? Colors.blue
                                            : Colors.transparent,
                                          child: Text(
                                            UiConstants.surveyTimeOptions[1],
                                            style: TextStyle(
                                                color:
                                                controller.movingDetails
                                                    ?.surveyTime ==
                                                    UiConstants.surveyTimeOptions[1]
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                          shape: StadiumBorder(
                                              side: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2.0)),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            controller.movingDetails?.surveyTime = UiConstants.surveyTimeOptions[2];
                                            setState(() {});
                                          },
                                          color: controller.movingDetails?.surveyTime ==
                                              UiConstants.surveyTimeOptions[2]
                                              ? Colors.blue
                                              : Colors.transparent,
                                          child: Text(UiConstants.surveyTimeOptions[2],
                                            style: TextStyle(
                                                color:
                                                controller.movingDetails
                                                    ?.surveyTime ==
                                                    UiConstants.surveyTimeOptions[2]
                                                    ? Colors.white
                                                    : Colors.black),),
                                          shape: StadiumBorder(
                                              side: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2.0)),
                                        )
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
                  ),
                  floatingActionButton: FloatingActionButton.extended(
                    onPressed:controller.upload,
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    label: Text(
                      UiConstants.requestMoversButtonText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                snapshot.hasData
                    ? snapshot.data
                    ? Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  color: Colors.black12,
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CircularProgressIndicator()),
                )
                    : Container()
                    : Container()
              ],
            );
          }),
    );
  }

}
