import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'time_converter.dart';

class DateTimePickerUtilities{

  static BuildContext context;
  static double viewHeight, viewWidth;
  static Function mainUIChangedCallBack;


  static void _setContext(BuildContext buildContext, var height, var width){
    context = buildContext;
    viewHeight = height;
    viewWidth = width;
  }

  static void setCallBack(Function callback){
    mainUIChangedCallBack = callback;
  }

  static Widget getTimePicker(var height,var width, var context,){
    _setContext(context, height, width);
    var date = DateTime.now();
    return Container(
        color: Colors.white,
        height: height*0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child:Text("Select Date", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
              padding: EdgeInsets.all(0.5*5),
            ),
            Container(
              child:CupertinoDatePicker(
                onDateTimeChanged: (value){
                    date = value;
                },
                mode: CupertinoDatePickerMode.dateAndTime,
                use24hFormat: false,
                initialDateTime: DateTime.now(),
                maximumYear: 2018,
                minimumYear: 1950,
              ),
              height: height*0.2,
            ),
            RaisedButton(
              child: Text("OK", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),
              color: Colors.deepPurple,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              disabledColor: Colors.deepPurple[100],
              splashColor: Colors.white,
              onPressed: (){
                var dateTime = DateFormat.yMMMEd("en_US").format(date)
                    + " , " + DateFormat("h:mm a").format(date);
                mainUIChangedCallBack(dateTime);
                Navigator.pop(context);
              },
            )

          ],
        )
    );
  }
}