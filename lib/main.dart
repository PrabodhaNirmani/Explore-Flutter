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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: _height*0.885,
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
                            (){print ("tapped on add name");},
                            "ADD NAME",
                            Colors.white,
                            false
                        ),
                        new FabMenuButton.withText(
                            new Icon(FontAwesomeIcons.calendar,color: Colors.white,),
                            Colors.transparent,
                            5.0,
                            (){print ("tapped on add name");},
                            "ADD BIRTHDAY",
                            Colors.white,
                            false
                        ),
                        new FabMenuButton.withText(
                            new Icon(FontAwesomeIcons.phone ,color: Colors.white,),
                            Colors.transparent,
                            5.0,
                            (){print ("tapped on add name");},
                            "ADD PHONE NUMBER",
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
          ],
        ),
      ),
    );
  }
}
