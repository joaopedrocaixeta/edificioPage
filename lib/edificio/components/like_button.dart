import 'package:flutter/material.dart';

import '../../constants.dart';

class LikeButton extends StatefulWidget {
  final int likeCount;
  LikeButton({this.likeCount});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool liked = false;
  int likeCount;

  initState(){
   likeCount = widget.likeCount;
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          liked = !liked;
          liked ? likeCount += 1 : likeCount -= 1;
        });
      },
      child: Row(
        children: [
          Icon(
            Icons.favorite, 
            color: liked ? kDarkBlue: kGrey,
          ),
          Text(likeCount.toString(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}