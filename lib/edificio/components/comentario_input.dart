import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';

class ComentarioInput extends StatefulWidget {

  @override
  _ComentarioInputState createState() => _ComentarioInputState();
}

class _ComentarioInputState extends State<ComentarioInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      image: NetworkImage("https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg")
                    )
                )
            ),
            SizedBox(width:10),
            Expanded(
                child: Container(
                  height: 40,
                child: TextField(
                  cursorColor: kDarkBlue,
                  maxLines: 20,
                  textInputAction: TextInputAction.newline,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 4, top:8),
                    hintText: "Adicionar um comentário público",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: kGrey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(),
      ]
    );
  }
}