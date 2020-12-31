import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'edificio_galery.dart';
 
class EdificioCarousel extends StatefulWidget {
  EdificioCarousel() : super();
  
  @override
  EdificioCarouselState createState() => EdificioCarouselState();
}
 
class EdificioCarouselState extends State<EdificioCarousel> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://firebasestorage.googleapis.com/v0/b/retomba-d3cf1.appspot.com/o/ImagensGaleria%2Festacao_rodoviaria%20(3).jpg?alt=media&token=3f72ae75-03b4-4305-895e-faba8f361d68',
    'https://firebasestorage.googleapis.com/v0/b/retomba-d3cf1.appspot.com/o/ImagensGaleria%2Festacao_rodoviaria%20(2).jpg?alt=media&token=f360a8c7-2953-4d0c-bf8e-7f89a3a77d2b',
    'https://firebasestorage.googleapis.com/v0/b/retomba-d3cf1.appspot.com/o/ImagensGaleria%2Festacao_rodoviaria%20(1).jpg?alt=media&token=5b6e8cbf-a443-43ca-9ae1-6cb741587942',
    'https://firebasestorage.googleapis.com/v0/b/retomba-d3cf1.appspot.com/o/ImagensGaleria%2Festacao_rodoviaria%20(4).jpg?alt=media&token=be5ee4e5-7379-46a9-8d97-f790a8262c09',
    'https://firebasestorage.googleapis.com/v0/b/retomba-d3cf1.appspot.com/o/ImagensGaleria%2Festacao_rodoviaria%20(6).jpg?alt=media&token=9125230d-b05c-4625-b6fb-f261acac3502'
  ];
 
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
      height: 240,
      child: Stack(
        children: [ 
          Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  carouselSlider = CarouselSlider(
                    viewportFraction: 0.8,
                    height: 230,
                    initialPage: 0,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    reverse: false,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () => Navigator.push(context, _createGalleryRoute(imgList, _current)),
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
                                  
                ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius:1,
                    color: kDarkBlue.withOpacity(0.2),
                    offset: Offset(0,-2)
                    
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
            ),
          ),
        ],
      ),
    );
  }
  MaterialPageRoute _createGalleryRoute(
    List imgList, int index) {
    return MaterialPageRoute(
      builder: (context) => EdificioGalleryPage(
         imgList: imgList,
         currentIndex: index,
      ),
   );
  }
}