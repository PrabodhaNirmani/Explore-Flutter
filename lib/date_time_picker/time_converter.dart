class DateTimeConverter{


  static getConvertedDate(String date){
    print("DateTimeConverter.getConvertedDate : " + date);
    return date;
  }

  static getConvertedTime(String time){
    print("DateTimeConverter.getConvertedTime : " + time);
    var list = time.split(":");
    var minutes = list[1];
    var hours = int.parse(list[0]);
    var am = "AM";
    if(hours>12){
      hours = hours - 12;
      am = "PM";
    }else if(hours<12){
      am = "AM";
    }else{
      am = "PM";
    }
    return hours.toString() + ":" + minutes + " "+am;
  }
}