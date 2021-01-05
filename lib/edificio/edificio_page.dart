import 'package:edificiopage/constants.dart';
import 'package:edificiopage/models/edificios.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';


import 'edificio_page_content.dart';

class MyTab extends StatelessWidget{
  final String text;
  const MyTab({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        constraints: BoxConstraints.expand(width: 90, height: 35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: kDarkBlue, width: 2)),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
      ),
    );
  }
}

class EdificioTabs extends StatelessWidget {

  static List <EdificioPageMain> _edificioPages = List <EdificioPageMain>.generate(edificios.length, (index) => EdificioPageMain(edificio: edificios[index],));
  static List <MyTab> _edificioTabs = List <MyTab>.generate(edificios.length, (index) => MyTab(text: edificios[index].startYear,));
 
  @override
  Widget build(BuildContext context) {
        
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: DefaultTabController(
        length: edificios.length,
          child: Scaffold(
            body: TabBarView(children: _edificioPages),
            bottomNavigationBar: TabBar(
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              labelPadding: EdgeInsets.only(left: 20),
              unselectedLabelColor: kDarkBlue,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BubbleTabIndicator(
                insets: EdgeInsets.only(left: 20,),
                indicatorHeight: 35.0,
                indicatorColor: kDarkBlue,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              tabs: _edificioTabs,
            ),
          ),
      )
    );
  }
}