import 'package:carousel_slider/carousel_slider.dart';
import 'package:edificiopage/components/leadingButton.dart';
import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class EdificioGalleryPage extends StatefulWidget {
  final List imgList;
  final int currentIndex;

  EdificioGalleryPage(
      {Key key, @required this.imgList, @required this.currentIndex})
      : super(key: key);

  @override
  _EdificioGalleryPageState createState() =>_EdificioGalleryPageState();
}

class _EdificioGalleryPageState extends State<EdificioGalleryPage> {
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentIndex);
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,// transparent status bar
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarColor: Colors.black, // navigation bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    //SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          _buildPhotoViewGallery(),
          LeadingButton(
            icon: AnimatedIcons.menu_close, 
            setRoute: (context) { Navigator.pop(context);},
          ),
        ],
      ),
    );
  }  

  PhotoViewGallery _buildPhotoViewGallery() {
    return PhotoViewGallery.builder(
      customSize: Size.fromWidth(MediaQuery.of(context).size.width*0.9),
      itemCount: widget.imgList.length,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.imgList[index]),
          tightMode: true,
          heroAttributes: const PhotoViewHeroAttributes(tag: Text('img')),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
        );
      },
      scrollPhysics: const ClampingScrollPhysics(),
      pageController: _pageController,
      loadingBuilder: (BuildContext context, ImageChunkEvent event) {
        return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(kLightBlue),));
      },
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}