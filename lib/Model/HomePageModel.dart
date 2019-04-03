class HomePageModel{
  String movingStatus;
  Map<String,int> items;
  Map<String,double> quotation={};
  double total=0;
  HomePageModel(){
    quotation.putIfAbsent("Total",(){return 1.0;});
    quotation.putIfAbsent("Tota",(){return 5.0;});
    quotation.forEach((a,b)=>total+=b);
    print(total.toString());
  }

}

