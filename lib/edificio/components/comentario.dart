import 'package:edificiopage/components/cross_plataform_svg.dart';
import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';

class Comentario extends StatefulWidget {

  @override
  _ComentarioState createState() => _ComentarioState();
}

class _ComentarioState extends State<Comentario> {
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
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('José'+' - '+'1 mês atrás',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 11,
                    ),                
                  ),
                  SizedBox(height: 8),
                  Text('Eu costumava ir nessa estação todo dia! Nunca vou me esquecer de quando vi o meu marido pela primeira vez em 1973. Nós ainda éramos crianças, tinha 6 bla bla bla',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14),                
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        //like
                        child: Row(
                          children: [
                            CrossPlatformSvg.asset("https://svgshare.com/i/Sm_.svg", height: 20),
                            Text(' 17', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        //comment
                        child: Row(
                          children: [
                            Icon(Icons.comment_rounded, color: kDarkBlue,),
                            Text(' 4', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400))
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
    );
  }
}