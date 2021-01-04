import 'package:edificiopage/models/comments.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'like_button.dart';

class ComentarioDialog extends StatelessWidget {
  final Comments comments;

  const ComentarioDialog({Key key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(20,10,20,30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(comments.userImg)
                        )
                    )
                ),
                SizedBox(width:10),
                Expanded(
                  child: Text(comments.userName+' - '+comments.timeAgo,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(comments.comment,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 14),                
            ),

            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LikeButton(likeCount: comments.likeCount),
                  SizedBox(width: 5),
                  GestureDetector(
                    //comment
                    child: Row(
                      children: [
                        Icon(Icons.comment_rounded, color: kDarkBlue,),
                        Text(
                          comments.commentCount > 0 ? comments.commentCount.toString() : "", 
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    //more-denunciar
                    child: Icon(Icons.more_vert_rounded, color: kDarkBlue,),
                  ),
              ],
            ),
          ]
        )
      ],
    );
  }
}