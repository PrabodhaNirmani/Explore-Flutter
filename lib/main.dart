import 'package:explore_flutter/custom_dialog/custom_dialog.dart';
import 'package:explore_flutter/custom_dialog/dialog_items.dart';
import 'package:flutter/material.dart';
import 'fab_menu/fab_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Explore Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _minimumPadding = 5.0;
  static double _height;
  static double _width;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Container(
              child:Align(
                alignment: Alignment.bottomRight,
                child:Padding(
                  padding: EdgeInsets.only(right:_minimumPadding, bottom: _minimumPadding),
                  child:new FabMenu(
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
                  ),
                ),),),
      ),
    );
  }
  
  
  _buildAddPersonDialog(){
    List<DialogItem> inputFields = [
      DialogItem.buildTextFieldWithInputDecorationIcon(
        inputAction: TextInputAction.done,
        inputDecorationLabelText: "Name",
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        inputDecorationIconColor: Colors.purple,
        inputDecorationIconData: FontAwesomeIcons.user,
      ),
      DialogItem.buildTextFieldWithInputDecorationLabel(
        inputAction: TextInputAction.done,
        inputDecorationLabelText: "Age",
        controller: TextEditingController(),
        keyboardType: TextInputType.number,
      ),
      DialogItem.buildTextFieldWithInputDecorationLabel(
        inputDecorationLabelText: "Job",
        inputAction: TextInputAction.done,
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
      )

    ];
    List<DialogItem> raisedButtons = [
      DialogItem.buildRaisedButton(
          raisedButtonColor: Colors.purple,
          raisedButtonDisabledColor: Colors.purple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonLabelText: "Add",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){}
      ),
      DialogItem.buildRaisedButton(
          raisedButtonColor: Colors.purple,
          raisedButtonDisabledColor: Colors.purple[100],
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
          dialogColor: Colors.purple[50],
          title:"Add Person",
          titleTextColor:Colors.purple,
          height: _height*0.75,
          width:_width*0.8,
          inputFieldsList: inputFields,
          raisedButtonsList: raisedButtons,
        )
    );
  }
  
  _buildAddProductDialog(){
    List<DialogItem> inputFields = [
      DialogItem.buildTextFieldWithInputDecorationLabel(
        inputAction: TextInputAction.done,
        inputDecorationLabelText: "Product Name",
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
      ),
      DialogItem.buildDateTextFieldWithInputDecorationLabel(
        inputDecorationLabelText: "Dispact date",
        controller: TextEditingController(),
      ),
    ];
    List<DialogItem> raisedButtons = [
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.purple,
          raisedButtonDisabledColor: Colors.purple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonIconColor: Colors.white,
          raisedButtonIconData: Icons.add_circle_outline,
          raisedButtonLabelText: "Add",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){}
      ),
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.purple,
          raisedButtonDisabledColor: Colors.purple[100],
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
          dialogColor: Colors.purple[50],
          title:"Add Product",
          titleTextColor:Colors.purple,
          height: _height*0.75,
          width:_width*0.8,
          inputFieldsList: inputFields,
          raisedButtonsList: raisedButtons,
        )
    );
  }
  
  _buildAddEventDialog(){
    List<DialogItem> inputFields = [
      DialogItem.buildTextFieldWithInputDecorationIcon(
        inputAction: TextInputAction.done,
        inputDecorationLabelText: "Event Name",
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        inputDecorationIconData: FontAwesomeIcons.info,
        inputDecorationIconColor: Colors.purple
      ),
      DialogItem.buildDateTextFieldWithInputDecorationIcon(
        inputDecorationLabelText: "Event date",
        controller: TextEditingController(),
        inputDecorationIconData: FontAwesomeIcons.calendar,
        inputDecorationIconColor: Colors.purple

      ),
    ];
    List<DialogItem> raisedButtons = [
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.purple,
          raisedButtonDisabledColor: Colors.purple[100],
          raisedButtonSplashColor: Colors.white,
          raisedButtonBorderRadius: 30.0,
          raisedButtonIconColor: Colors.white,
          raisedButtonIconData: Icons.add_circle_outline,
          raisedButtonLabelText: "Add",
          raisedButtonLabelTextColor: Colors.white,
          raisedButtonOnPressed: (){}
      ),
      DialogItem.buildIconRaisedButton(
          raisedButtonColor: Colors.purple,
          raisedButtonDisabledColor: Colors.purple[100],
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
          dialogColor: Colors.purple[50],
          title:"Add Event",
          titleTextColor:Colors.purple,
          height: _height*0.75,
          width:_width*0.8,
          inputFieldsList: inputFields,
          raisedButtonsList: raisedButtons,
        )
    );
  }

}
