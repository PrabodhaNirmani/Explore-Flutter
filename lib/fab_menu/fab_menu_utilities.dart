import 'package:explore_flutter/custom_dialog/custom_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:explore_flutter/fab_menu/fab_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:explore_flutter/custom_dialog/dialog_items.dart';

class FabMenuUtilities{

  static BuildContext context;
  static double viewHeight, viewWidth;
  static Function mainUIChangedCallBack;
  static List<Widget> listViewItems = new List<Widget>();

  static void _setContext(BuildContext buildContext, var height, var width){
    context = buildContext;
    viewHeight = height;
    viewWidth = width;
  }

  static void setCallBack(Function callback){
    mainUIChangedCallBack = callback;
  }

  static Widget getFabMenu(BuildContext context, var height, var width){
    _setContext(context, height, width);
    return FabMenu(
      [
        new FabMenuButton.withText(
            new Icon(FontAwesomeIcons.user,color: Colors.white,),
            Colors.transparent,
            5.0,
            _buildAddPersonDialog,
            "ADD PERSON",
            Colors.white,
            false
        ),
        new FabMenuButton.withText(
            new Icon(FontAwesomeIcons.shoppingCart,color: Colors.white,),
            Colors.transparent,
            5.0,
            _buildAddProductDialog,
            "ADD PRODUCT",
            Colors.white,
            false
        ),
        new FabMenuButton.withText(
            new Icon(FontAwesomeIcons.calendarPlus ,color: Colors.white,),
            Colors.transparent,
            5.0,
            _buildAddEventDialog,
            "ADD EVENT",
            Colors.white,
            false
        ),
      ],
      Colors.white,
      Colors.deepPurple,
      FontAwesomeIcons.plus,
      FontAwesomeIcons.minus,
      5.0,
      Colors.black,
      0.7
    );
  }


  static _buildAddPersonDialog(){
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController ageCtrl = TextEditingController();
    TextEditingController jobCtrl = TextEditingController();

    List<DialogItem> inputFields = [
      DialogItem.buildTextFieldWithInputDecorationIcon(
        inputAction: TextInputAction.done,
        inputDecorationLabelText: "Name",
        controller: nameCtrl,
        keyboardType: TextInputType.text,
        inputDecorationIconColor: Colors.deepPurple,
        inputDecorationIconData: FontAwesomeIcons.user,
      ),
      DialogItem.buildTextFieldWithInputDecorationLabel(
        inputAction: TextInputAction.done,
        inputDecorationLabelText: "Age",
        controller: ageCtrl,
        keyboardType: TextInputType.number,
      ),
      DialogItem.buildTextFieldWithInputDecorationLabel(
        inputDecorationLabelText: "Job",
        inputAction: TextInputAction.done,
        controller: jobCtrl,
        keyboardType: TextInputType.text,
      )

    ];
    List<DialogItem> raisedButtons = [
      DialogItem.buildRaisedButton(
          raisedButtonColor: Colors.deepPurple,
          raisedButtonDisabledColor: Colors.deepPurple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonLabelText: "Add",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){
            ListTile personWidget = ListTile(
              leading: Icon(FontAwesomeIcons.user,color: Colors.deepPurple,size: 30.0,),
              title: Text("Name : "+ nameCtrl.text),
              subtitle: Text("Age : " + ageCtrl.text + " | Occupation : " +jobCtrl.text),
            );
            listViewItems.add(personWidget);
            mainUIChangedCallBack(listViewItems.length);
            Navigator.pop(context);
          }
      ),
      DialogItem.buildRaisedButton(
          raisedButtonColor: Colors.deepPurple,
          raisedButtonDisabledColor: Colors.deepPurple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonLabelText: "Cancel",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){
            Navigator.pop(context);
          }
      )
    ];

    showDialog(
        context: context,
        // ignore: deprecated_member_use
        child:CustomDialog(
          dialogColor: Colors.deepPurple[50],
          title:"Add Person",
          titleTextColor:Colors.deepPurple,
          height: viewHeight*0.75,
          width: viewWidth*0.8,
          inputFieldsList: inputFields,
          raisedButtonsList: raisedButtons,
        )
    );
  }

  static _buildAddProductDialog(){
    TextEditingController productNameCtrl = TextEditingController();
    TextEditingController dateCtrl = TextEditingController();

    List<DialogItem> inputFields = [
      DialogItem.buildTextFieldWithInputDecorationLabel(
        inputAction: TextInputAction.done,
        inputDecorationLabelText: "Product Name",
        controller: productNameCtrl,
        keyboardType: TextInputType.text,
      ),
      DialogItem.buildDateTextFieldWithInputDecorationLabel(
        inputDecorationLabelText: "Dispatch date",
        controller: dateCtrl,
      ),
    ];
    List<DialogItem> raisedButtons = [
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.deepPurple,
          raisedButtonDisabledColor: Colors.deepPurple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonIconColor: Colors.white,
          raisedButtonIconData: Icons.add_circle_outline,
          raisedButtonLabelText: "Add",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){
            ListTile productWidget = ListTile(
              leading: Icon(FontAwesomeIcons.shoppingCart,color: Colors.deepPurple,size: 30.0,),
              title: Text("Product Name : "+productNameCtrl.text),
              subtitle: Text("Product Dispatch Date : "+dateCtrl.text),
            );
            listViewItems.add(productWidget);
            mainUIChangedCallBack(listViewItems.length);
            Navigator.pop(context);
          }
      ),
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.deepPurple,
          raisedButtonDisabledColor: Colors.deepPurple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonIconColor: Colors.white,
          raisedButtonIconData: FontAwesomeIcons.timesCircle,
          raisedButtonLabelText: "Cancel",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){
            Navigator.pop(context);
          }
      )
    ];

    showDialog(
        context: context,
        // ignore: deprecated_member_use
        child:CustomDialog(
          dialogColor: Colors.deepPurple[50],
          title:"Add Product",
          titleTextColor:Colors.deepPurple,
          height: viewHeight*0.75,
          width: viewWidth*0.8,
          inputFieldsList: inputFields,
          raisedButtonsList: raisedButtons,
        )
    );
  }

  static _buildAddEventDialog(){
    TextEditingController eventNameCtrl = TextEditingController();
    TextEditingController dateCtrl = TextEditingController();
    List<DialogItem> inputFields = [
      DialogItem.buildTextFieldWithInputDecorationIcon(
          inputAction: TextInputAction.done,
          inputDecorationLabelText: "Event Name",
          controller: eventNameCtrl,
          keyboardType: TextInputType.text,
          inputDecorationIconData: FontAwesomeIcons.info,
          inputDecorationIconColor: Colors.deepPurple
      ),
      DialogItem.buildDateTextFieldWithInputDecorationIcon(
          inputDecorationLabelText: "Event date",
          controller: dateCtrl,
          inputDecorationIconData: FontAwesomeIcons.calendar,
          inputDecorationIconColor: Colors.deepPurple

      ),
    ];
    List<DialogItem> raisedButtons = [
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.deepPurple,
          raisedButtonDisabledColor: Colors.deepPurple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonIconColor: Colors.white,
          raisedButtonIconData: Icons.add_circle_outline,
          raisedButtonLabelText: "Add",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){
            ListTile eventWidget = ListTile(
              leading: Icon(FontAwesomeIcons.calendar,color: Colors.deepPurple,size: 30.0,),
              title: Text("Event Name : "+eventNameCtrl.text),
              subtitle: Text("Date of the Event : "+dateCtrl.text ),
            );
            listViewItems.add(eventWidget);
            mainUIChangedCallBack(listViewItems.length);
            Navigator.pop(context);
          }
      ),
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.deepPurple,
          raisedButtonDisabledColor: Colors.deepPurple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonIconColor: Colors.white,
          raisedButtonIconData: FontAwesomeIcons.timesCircle,
          raisedButtonLabelText: "Cancel",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){
            Navigator.pop(context);
          }
      )
    ];

    showDialog(
        context: context,
        // ignore: deprecated_member_use
        child:CustomDialog(
          dialogColor: Colors.deepPurple[50],
          title:"Add Event",
          titleTextColor:Colors.deepPurple,
          height: viewHeight*0.75,
          width: viewWidth*0.8,
          inputFieldsList: inputFields,
          raisedButtonsList: raisedButtons,
        )
    );
  }

  static Widget getListView(){
    return ListView.builder(
        itemCount: listViewItems.length,
        itemBuilder: (context, index) => listViewItems[index]);
  }

  static Widget getListEmptyMessage(){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text("Please tap on below Add button and enter items",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.deepPurple,fontSize: 20.0, fontWeight: FontWeight.bold,)),
    );
  }

}