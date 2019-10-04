import 'package:flutter/material.dart';
import 'package:explore_flutter/custom_dialog/dialog_items.dart';
import 'package:intl/intl.dart';


// ignore: must_be_immutable
class CustomDialog extends StatefulWidget {
  CustomDialog({this.raisedButtonsList, this.inputFieldsList, this.height, this.width,this.dialogColor, this.title, this.titleTextColor});
  final List<DialogItem> raisedButtonsList;
  final List<DialogItem> inputFieldsList;
  final double height,width;
  final Color dialogColor;
  final String title;
  final Color titleTextColor;

  @override
  State createState() => new MyDialogState();
}
class MyDialogState extends State<CustomDialog> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: widget.dialogColor,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)),
      title: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: widget.titleTextColor,
            fontSize: 20.0,
            fontFamily: 'CustomIcons',
            fontWeight: FontWeight.w600),),
      content: Container(
        width: double.maxFinite,
        height: widget.height*0.4,
        child: ListView(
          children: _buildInputFields(),
        ),
      ),
      actions: _buildActionButtons()
    );
  }

  List<Widget> _buildInputFields(){
    List<Widget> inputFields = new List<Widget>();
    for(var item in widget.inputFieldsList){
      switch(item.itemType){
        case DialogItemTags.TEXT_FIELD_WITH_INPUT_DECORATION_LABEL:
          inputFields.add(_showTextFieldWithInputDecorationLabel(item));
          break;
        case DialogItemTags.TEXT_FIELD_WITH_INPUT_DECORATION_ICON:
          inputFields.add(_showTextFieldWithInputDecorationIcon(item));
          break;
        case DialogItemTags.DATE_TEXT_FIELD_WITH_INPUT_DECORATION_LABEL:
          inputFields.add(_showDateTextFieldWithInputDecorationLabel(item));
          break;
        case DialogItemTags.DATE_TEXT_FIELD_WITH_INPUT_DECORATION_ICON:
          inputFields.add(_showDateTextFieldWithInputDecorationIcon(item));
          break;
        default:
          break;
      }
    }
    return inputFields;
  }

  List<Widget> _buildActionButtons(){
    List<Widget> actionButtons = new List<Widget>();
    for(var item in widget.raisedButtonsList){
      switch(item.itemType){
        case DialogItemTags.RAISED_BUTTON:
          actionButtons.add(_showRaisedButton(item));
          break;
        case DialogItemTags.ICON_RAISED_BUTTON:
          actionButtons.add(_showIconRaisedButton(item));
          break;
        default:
          break;
      }
    }
    return actionButtons;
  }

  Widget _showDateTextFieldWithInputDecorationIcon(DialogItem dialogItem) {
    return InkWell(
      onTap: ()async{
        DateTime picked = await showDatePicker(
            context: context,
            initialDate: new DateTime.now(),
            firstDate: new DateTime(2014),
            lastDate: new DateTime.now()
        );
        if(picked != null) setState(() {
          dialogItem.controller.text = DateFormat("dd/MM/yyyy").format(picked);
        });
      },
      child: IgnorePointer(
        child: new TextFormField(
          controller: dialogItem.controller,
          keyboardType: null,
          decoration: InputDecoration(
              labelText: dialogItem.inputDecorationLabelText,
              icon: new Icon(
                dialogItem.inputDecorationIconData,
                color: dialogItem.inputDecorationIconColor,
              )),
        ),),);
  }
  
  Widget _showDateTextFieldWithInputDecorationLabel(DialogItem dialogItem) {
    return InkWell(
      onTap: ()async{
        DateTime picked = await showDatePicker(
            context: context,
            initialDate: new DateTime.now(),
            firstDate: new DateTime(2014),
            lastDate: new DateTime.now()
        );
        if(picked != null) setState(() {
          dialogItem.controller.text = DateFormat("dd/MM/yyyy").format(picked);
        });
      },
      child: IgnorePointer(
        child: new TextFormField(
          controller: dialogItem.controller,
          keyboardType: null,
          decoration: InputDecoration(
            labelText: dialogItem.inputDecorationLabelText,
          ),
        ),),);
  }


  Widget _showTextFieldWithInputDecorationLabel(DialogItem dialogItem) {
    return TextFormField(
      controller: dialogItem.controller,
      maxLines: 1,
      keyboardType: dialogItem.keyboardType,
      textInputAction: dialogItem.inputAction,
      decoration: new InputDecoration(
        labelText: dialogItem.inputDecorationLabelText,
      ),
      onSaved: (value) {
        dialogItem.controller.text = value;
      },
    );
  }

  Widget _showTextFieldWithInputDecorationIcon(DialogItem dialogItem) {
    return TextFormField(
      controller: dialogItem.controller,
      maxLines: 1,
      keyboardType: dialogItem.keyboardType,
      textInputAction: dialogItem.inputAction,
      decoration: new InputDecoration(
        labelText: dialogItem.inputDecorationLabelText,
        icon: new Icon(
          dialogItem.inputDecorationIconData,
          color: dialogItem.inputDecorationIconColor,
        )
      ),
      onSaved: (value) {
        dialogItem.controller.text = value;
      },
    );
  }

  Widget _showIconRaisedButton(DialogItem dialogItem){
    return RaisedButton.icon(
      elevation: dialogItem.raisedButtonElevation,
      icon: Icon(dialogItem.raisedButtonIconData, color: dialogItem.raisedButtonIconColor,),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(dialogItem.raisedButtonBorderRadius)),
      color: dialogItem.raisedButtonColor,
      disabledColor: dialogItem.raisedButtonDisabledColor,
      splashColor: dialogItem.raisedButtonSplashColor,
      label: new Text(dialogItem.raisedButtonLabelText,
          style: new TextStyle(
              fontSize: 16.0,
              color: dialogItem.raisedButtonLabelTextColor,
              fontWeight: FontWeight.w700)),
      onPressed: dialogItem.raisedButtonOnPressed ,
    );
  }

  Widget _showRaisedButton(DialogItem dialogItem){
    return RaisedButton(
      elevation: dialogItem.raisedButtonElevation,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(dialogItem.raisedButtonBorderRadius)),
      color: dialogItem.raisedButtonColor,
      disabledColor: dialogItem.raisedButtonDisabledColor,
      splashColor: dialogItem.raisedButtonSplashColor,
      child: new Text(dialogItem.raisedButtonLabelText,
          style: new TextStyle(
              fontSize: 16.0,
              color: dialogItem.raisedButtonLabelTextColor,
              fontWeight: FontWeight.w700)),
      onPressed: dialogItem.raisedButtonOnPressed ,
    );
  }

  
}