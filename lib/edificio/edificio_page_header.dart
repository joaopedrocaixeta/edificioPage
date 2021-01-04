import 'dart:math';

import 'package:edificiopage/components/leadingButton.dart';
import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/edificio_carousel.dart';

class EdificioPageHeader implements SliverPersistentHeaderDelegate {
  EdificioPageHeader({
    this.minExtent,
    this.maxExtent,
  });

  double maxExtent;
  double minExtent;

  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: EdificioCarouselL(),
        ),
        LeadingButton(
            icon: AnimatedIcons.arrow_menu, 
            setRoute: (context) { Scaffold.of(context).showSnackBar(SnackBar(content: Text('voltar'),));},
          ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20.0, bottom: shrinkOffset+60),
            child: Container(
              width: 48,
              height: 48,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: Text('iniciarRota'),
                  onPressed: (){},
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions , color: kDarkBlue),
                      Text("IR", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: kDarkBlue),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:Stack(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40)),
                  boxShadow:[BoxShadow(
                    color: kDarkBlue.withOpacity(0.2),
                    blurRadius: 2,
                    offset: Offset(0,-2)
                  )]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Container(margin: EdgeInsets.only(top:20),height:2, width: 80,color: kLightGrey,alignment: Alignment.center,)]
              ),
            ]
          )
        ),
      ],
    );
  }
  double iconPadding(double shrinkOffset){
    return 1 - max(0.0, shrinkOffset)/maxExtent;
  }
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration => PersistentHeaderShowOnScreenConfiguration();

  @override
  TickerProvider get vsync => null;
}
