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
    
    //SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, 
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            _buildPhotoViewGallery(),
            LeadingButton(
              icon: AnimatedIcons.close_menu,
              setRoute: (context) { Navigator.pop(context);},
            ),
          ],
        ),
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
          heroAttributes: const PhotoViewHeroAttributes(tag: Text('txt')),
          minScale: PhotoViewComputedScale.contained * 0.9,
          maxScale: PhotoViewComputedScale.covered * 1.8,
        );
      },
      scrollPhysics: BouncingScrollPhysics(),
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