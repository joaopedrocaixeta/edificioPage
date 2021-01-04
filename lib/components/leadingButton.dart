import 'package:flutter/material.dart';

import '../constants.dart';


class LeadingButton extends StatefulWidget {
  final AnimatedIconData icon;
  final Function(BuildContext context) setRoute;

  LeadingButton(
      {Key key, @required this.icon, @required this.setRoute})
      : super(key: key);

  @override
  _LeadingButtonState createState() => _LeadingButtonState();
  
}

class _LeadingButtonState extends State<LeadingButton> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool isPlaying = false; 

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
    widget.setRoute(context);
    
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0,top:40.0, bottom:20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 48,
            height: 48,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () => _handleOnPressed(),
                backgroundColor: Colors.white,
                child: AnimatedIcon(
                  size: 30,
                  icon: widget.icon,
                  progress: _animationController,
                  color: kDarkBlue,
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}