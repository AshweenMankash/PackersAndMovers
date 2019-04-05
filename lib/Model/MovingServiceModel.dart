class MovingServiceModel{
  String pickUpAddress,dropAddress,surveyTime;
  DateTime date;

  MovingServiceModel(){
    date = new DateTime.now();
  }

  MovingServiceModel.fromJson(var jsonFile){
    this.pickUpAddress = jsonFile["pickUpAddress"];
    this.dropAddress = jsonFile["dropAddress"];
    this.date = DateTime.fromMillisecondsSinceEpoch(jsonFile["date"]);
    this.surveyTime = jsonFile["surveyTime"];
  }

  toJson(){
    return {
      "pickUpAddress":this.pickUpAddress,
      "dropAddress":this.dropAddress,
      "date":this.date.millisecondsSinceEpoch,
      "surveyTime":this.surveyTime
    };
  }


  notNull(){
    return this.pickUpAddress==null&&this.dropAddress==null&&this.date==null&&this.surveyTime==null;
  }

}