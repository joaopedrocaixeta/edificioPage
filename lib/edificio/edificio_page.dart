import 'package:edificiopage/components/leadingButton.dart';
import 'package:edificiopage/constants.dart';
import 'package:edificiopage/edificio/components/edificio_carousel1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/edificio_carousel.dart';
import 'components/edificio_carousel2.dart';
import 'edificio_page_content.dart';

class EdificioPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
        
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          body: EdificioPageMain(),
        )
    );
  }
}


/*
class EdificioPageMain1 extends StatelessWidget {
  const EdificioPageMain1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Align(
          alignment: Alignment.topCenter,
          child: EdificioCarouselL()
        ),
        ListView(
          children:[ Container(
            margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              boxShadow: [BoxShadow(
                color: kDarkBlue.withOpacity(0.2),
                blurRadius: 2,
                offset: Offset(0,-2)
              )]
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(height:2, width: 80,color: kLightGrey,alignment: Alignment.center,),
                      SizedBox(height:20)
                    
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1946-1976', style: TextStyle(fontWeight: FontWeight.w200),),
                      SizedBox(height:5),
                      Text('Estação Rodoviária Municipal', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                      SizedBox(height:40),
                      Text(
                        '''Passados quase um século de sua edifi-cação, a igreja foi demolida com a autorização da Cúria, no ano de 1943 e, no local, teve início a construção de um prédio para abrigar a Estação Rodoviá-ria da cidade, em estilo neocolonial, de planta regular, alongada no sentido norte-sul, de dois pavimentos, possuindo platibanda arrematadas com telhas cerâmicas tipo capa-e-canal.
    O andar do térreo foi construído nos limites do terreno e, hoje, seus vãos originais estão emparedados, o andar superior possui planta em forma de “T”. Ambos os andares possuem platibanda, sendo que a fachada norte do andar superior é coroada com um frontão arqueado na maneira corrente da época. Os interiores não apresentam a configuração original, possuem divisórias provisórias em ambos os andares.
                        '''
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
            
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 50),
                EdificioCarouselS(),
                SizedBox(height: 200),
              ],
            ),
          )
          ]
        ),
        
      ],

    );
  }
}
*/