import 'package:edificiopage/constants.dart';
import 'package:edificiopage/edificio/components/comentario_input.dart';
import 'package:edificiopage/models/comments.dart';
import 'package:edificiopage/models/edificios.dart';
import 'package:flutter/material.dart';
import 'components/comentario.dart';
import 'edificio_page_header.dart';

class EdificioPageMain extends StatelessWidget {
  final Edificios edificio;
  const EdificioPageMain({
    Key key, this.edificio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _heigth = MediaQuery.of(context).size.height;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers:[
        SliverPersistentHeader(
          delegate: EdificioPageHeader(minExtent: _heigth*0.15, maxExtent:_heigth*0.7, imgList: edificio.images, legendas: edificio.legendas),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(edificio.startYear + ' - '+ edificio.endYear, style: TextStyle(fontWeight: FontWeight.w200),),
                      SizedBox(height:5),
                      Text(edificio.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                      SizedBox(height:30),
                      Text(
                        edificio.description,
                        style: TextStyle(fontSize: 16, height:1.5),
                        
                      ),
                      SizedBox(height: 50,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Histórias do lugar', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(margin:EdgeInsets.only(bottom:4), height: 2, color: kDarkBlue,)
                            )
                        ],
                      ),
                      SizedBox(height: 40,),
                      ComentarioInput(),
                    ],
                ),
              ),
              
            ]
          ),
        
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 40, right:40),
              child: Comentario(comments: comments[index]),
            );
          },
          childCount: comments.length
          )
        ),
          
        
      ],

    );
  }
}

