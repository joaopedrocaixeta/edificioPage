import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'edificio_galery.dart';
 
class EdificioCarouselS extends StatefulWidget {
  EdificioCarouselS() : super();
  
  @override
  EdificioCarouselSState createState() => EdificioCarouselSState();
}
 
class EdificioCarouselSState extends State<EdificioCarouselS> {
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
  Column build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        carouselSlider = CarouselSlider(
          viewportFraction: 0.6,
          height: 150,
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
                return Container(
                  decoration: BoxDecoration(
                    color: kDarkBlue,
                    boxShadow: [BoxShadow(
                      color: kDarkBlue.withOpacity(0.3),
                      blurRadius: 2,
                      offset: Offset(0,1),
                    )],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Hero(
                        tag: Text('img'),
                        child: Image.network(imgUrl, fit: BoxFit.cover),
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      _createGalleryRoute(imgList, _current),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: map<Widget>(imgList, (index, url) {
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
        SizedBox(
          height: 10.0,
        ),
        
      ],
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