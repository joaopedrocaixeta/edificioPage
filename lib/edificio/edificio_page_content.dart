import 'package:edificiopage/constants.dart';
import 'package:flutter/material.dart';
import 'components/comentario.dart';
import 'edificio_page_header.dart';

class EdificioPageMain extends StatelessWidget {
  const EdificioPageMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _heigth = MediaQuery.of(context).size.height;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers:[
        SliverPersistentHeader(
          delegate: EdificioPageHeader(minExtent: _heigth*0.15, maxExtent:_heigth*0.7,),
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
                      Text('1946 - 1976', style: TextStyle(fontWeight: FontWeight.w200),),
                      SizedBox(height:5),
                      Text('Estação Rodoviária Municipal', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                      SizedBox(height:30),
                      Text(
                        '''Passados quase um século de sua edificação, a igreja foi demolida com a autorização da Cúria, no ano de 1943 e, no local, teve início a construção de um prédio para abrigar a Estação Rodoviá-ria da cidade, em estilo neocolonial, de planta regular, alongada no sentido norte-sul, de dois pavimentos, possuindo platibanda arrematadas com telhas cerâmicas tipo capa-e-canal.\n\nO andar do térreo foi construído nos limites do terreno e, hoje, seus vãos originais estão emparedados, o andar superior possui planta em forma de “T”. Ambos os andares possuem platibanda, sendo que a fachada norte do andar superior é coroada com um frontão arqueado na maneira corrente da época. Os interiores não apresentam a configuração original, possuem divisórias provisórias em ambos os andares.
                        ''',
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
                      Comentario(),
                      Comentario(),
                      Comentario(),
                      Comentario(),
                      Comentario(),
                      Comentario(),
                      Comentario(),
                      Comentario(),
                    ],
                ),
              ),
              
            ]
          ),
        
        ),
          
        
      ],

    );
  }
}

