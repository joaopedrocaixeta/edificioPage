import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'edificio_gallery.dart';
 
class EdificioCarousel extends StatefulWidget {
  final List<String> imgList;
  final List<String> legendas;
  EdificioCarousel(this.imgList, this.legendas) : super();
  
  @override
  EdificioCarouselState createState() => EdificioCarouselState();
}
 
class EdificioCarouselState extends State<EdificioCarousel> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
 
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
 
  @override
  Container build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height*0.7,
      child: Stack(
        children: [ 
          CarouselSlider(
            viewportFraction: 1.8,
            height: MediaQuery.of(context).size.height*0.7,
            initialPage: 0,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 6),
            reverse: false,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },

            items: widget.imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, _createGalleryRoute(widget.imgList, _current, widget.legendas)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: NetworkImage(
                            imgUrl,
                          ),
                        ),
                        color: kDarkBlue,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),             
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: map<Widget>(widget.imgList, (index, url) {
                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? kDarkBlue : kLightGrey,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
  MaterialPageRoute _createGalleryRoute(
    List imgList, int index, List legendas) {
    return MaterialPageRoute(
      builder: (context) => EdificioGalleryPage(
         imgList: imgList,
         currentIndex: index,
         legendas: legendas,
      ),
   );
  }
}