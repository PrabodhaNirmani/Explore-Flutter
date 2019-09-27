import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void OnFabMenuItemPressed();

class FabMenu extends StatefulWidget {
  const FabMenu(this._fabMiniMenuItemList, this._fabColor, this._fabIconColor,this._fabIcon,  this._fabIconReversed, this._elevation,  this._overlayColor, this._overlayOpacity );

  final List<FabMenuButton> _fabMiniMenuItemList;
  final IconData _fabIcon;
  final IconData _fabIconReversed;
  final Color _fabColor;
  final Color _fabIconColor;
  final double _elevation;
  final double _overlayOpacity;
  final Color _overlayColor;

  @override
  FabMenuState createState() => new FabMenuState(
      _fabMiniMenuItemList);
}

class FabMenuState extends State<FabMenu> with TickerProviderStateMixin {
  FabMenuState(this._fabMiniMenuItemList);

  bool _isTapped = true;
  final List<FabMenuButton> _fabMiniMenuItemList;
  List<FabMenuItemWidget> _fabMenuItems;

  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );
    _controller.reverse();
    setFabMenu(this._fabMiniMenuItemList);
    super.initState();
  }

  void setFabMenu(List<FabMenuButton> fabMenuList) {
    List<FabMenuItemWidget> fabMenuItems = new List();
    for (int i = 0; i < _fabMiniMenuItemList.length; i++) {
      fabMenuItems.add(new FabMenuItemWidget(
        text: _fabMiniMenuItemList[i].text,
        icon: _fabMiniMenuItemList[i].icon,
        index: i,
        onPressed: _fabMiniMenuItemList[i].onPressed,
        textColor: _fabMiniMenuItemList[i].textColor,
        fabColor: _fabMiniMenuItemList[i].fabColor,
        controller: _controller,
        itemCount: _fabMiniMenuItemList.length,
      ));
    }
    this._fabMenuItems = fabMenuItems;
  }

  void _onTapped() {
    setState(() {
      if (_isTapped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isTapped = ! _isTapped;
    });
  }

  Widget _renderOverlay() {
    return Positioned(
      right: -16.0,
      bottom: -16.0,
      top: !_isTapped ? 0.0 : null,
      left: !_isTapped ? 0.0 : null,
      child: GestureDetector(
        onTap: _onTapped,
        child:Container(color: widget._overlayColor.withOpacity(widget._overlayOpacity)),
      ),
    );
  }

  Widget _renderButtons(){
    return new Container  (
        margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _fabMenuItems,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new FloatingActionButton(
                    child: !_isTapped ? Icon(widget._fabIconReversed,color: Colors.white,)
                        : Icon(widget._fabIcon,color: widget._fabIconColor,),
                    elevation: widget._elevation,
                    mini: !_isTapped,
                    backgroundColor: !_isTapped ? Colors.transparent : widget._fabColor,
                    shape: CircleBorder(side: BorderSide(color: !_isTapped ? Colors.white : widget._fabIconColor, width: 3.0)),
                    onPressed: _onTapped)
              ],
            ),
          ],
        ));
  }
  @override
  Widget build(BuildContext context) {
    final children = [
      !_isTapped ? _renderOverlay() : Container(),
      _renderButtons(),
    ];
    return Stack(
      alignment: Alignment.bottomRight,
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: children,
    );
  }
}

class FabMenuButton {
  double elevation;
  String text;
  Icon icon;
  Color fabColor;
  Color textColor;
  OnFabMenuItemPressed onPressed;
  bool hideOnClick;

  FabMenuButton.withText(
      this.icon,
      this.fabColor,
      this.elevation,
      this.onPressed,
      this.text,
      this.textColor,
      this.hideOnClick);
}

class FabMenuItemWidget extends StatelessWidget {
  const FabMenuItemWidget({Key key,
    this.elevation,
    this.text,
    this.icon,
    this.fabColor,
    this.textColor,
    this.index,
    this.controller,
    this.onPressed,
    this.itemCount})
      : super(key: key);
  final double elevation;
  final String text;
  final Icon icon;
  final Color fabColor;
  final Color textColor;
  final int index;
  final int itemCount;
  final OnFabMenuItemPressed onPressed;
  final AnimationController controller;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 8.0),
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: controller,
                curve: new Interval(((index + 1) / 10), 1.0,
                    curve: Curves.linear),
              ),
              child: _getChip(),
            ),
          ),
          new ScaleTransition(
            scale: new CurvedAnimation(
              parent: controller,
              curve: new Interval(((index + 1) / 10), 1.0,
                  curve: Curves.linear),
            ),
            child: _getFloatingActionButton(),
          )
        ],
      ),
    );
  }

  Widget _getChip() {
    return Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style:
      new TextStyle(color: textColor, fontWeight: FontWeight.bold),
    );
  }

  Widget _getFloatingActionButton() {
    return new FloatingActionButton(
        elevation: elevation,
        backgroundColor: fabColor,
        child: icon,
        shape: CircleBorder(side: BorderSide(color: textColor, width: 3.0)),
        heroTag: "$index",
        onPressed: () {
          onPressed();
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 5.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new AnimatedBuilder(
            builder: _buildAnimation,
            animation: controller,
          ),
        ],
      ),
    );
  }
}