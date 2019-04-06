class MovingServiceModel{
  String pickUpAddress,dropAddress,surveyTime;
  DateTime date;
  bool accepted = false;
  MovingServiceModel(){
    date = new DateTime.now();
  }

  MovingServiceModel.fromJson(var jsonFile){
    this.pickUpAddress = jsonFile["pickUpAddress"];
    this.dropAddress = jsonFile["dropAddress"];
    this.date = DateTime.fromMillisecondsSinceEpoch(jsonFile["date"]);
    this.surveyTime = jsonFile["surveyTime"];
    this.accepted = jsonFile["accepted"];
  }

  toJson(){

    return {
      "pickUpAddress":this.pickUpAddress,
      "dropAddress":this.dropAddress,
      "date":this.date.millisecondsSinceEpoch,
      "surveyTime":this.surveyTime,
      "accepted":this.accepted
    };
  }


  notNull(){
    bool notNull = this.pickUpAddress.isNotEmpty&&this.dropAddress.isNotEmpty&&this.date!=null&&this.surveyTime!=null;
    print(this.pickUpAddress+this.dropAddress+this.date.toIso8601String()+this.surveyTime+notNull.toString());

    return notNull;
  }

}