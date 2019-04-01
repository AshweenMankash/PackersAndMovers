class MovingServiceModel{
  String pickUpAddress,dropAddress,surveyTime;
  int date;

  MovingServiceModel.fromJson(var jsonFile){
    this.pickUpAddress = jsonFile["pickUpAddress"];
    this.dropAddress = jsonFile["dropAddress"];
    this.date = jsonFile["date"];
    this.surveyTime = jsonFile["surveyTime"];
  }

  toJson(){
    var jsonFile = {
      "pickUpAddress":this.pickUpAddress,

    };
  }

}