import 'package:flutter/material.dart';
import 'package:explore_flutter/fab_menu/fab_menu_utilities.dart';
import 'package:flutter/cupertino.dart';

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

  static double _height;
  static double _width;
  static double _appBarHeight;
  bool _isEmpty=true;

  @override
  void initState() {
    FabMenuUtilities.setCallBack(mainUIChangedCallBack);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text(widget.title),
    );
    _appBarHeight = appBar.preferredSize.height;
    _height = (MediaQuery.of(context).size.height-_appBarHeight);
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body:Stack(
        children: <Widget>[
          Container(
            height: _height,
            child: _isEmpty ? FabMenuUtilities.getListEmptyMessage(): FabMenuUtilities.getListView(),
          ),
          FabMenuUtilities.getFabMenu(context, _height, _width),
        ],
      )
    );
  }

  mainUIChangedCallBack(int size){
    if(size>0){
      setState(() {
        _isEmpty = false;
      });
    }
  }

}
