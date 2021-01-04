import 'package:edificiopage/constants.dart';
import 'package:edificiopage/edificio/components/like_button.dart';
import 'package:edificiopage/models/comments.dart';
import 'package:flutter/material.dart';

import 'comentario_dialog.dart';

class Comentario extends StatelessWidget {
  final Comments comments;
  const Comentario({Key key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(comments.userName+' - '+comments.timeAgo,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 11,
                      ),                
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (ctxt) => new ComentarioDialog(comments: comments),
                        );
                      },
                      child: Text(comments.comment,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: 14),                
                      ),
                    ),
                    SizedBox(height: 15),
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
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(),
        ]
      ),
    );
  }
}
