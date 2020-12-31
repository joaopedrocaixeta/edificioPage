import 'package:edificiopage/components/leadingButton.dart';
import 'package:edificiopage/constants.dart';
import 'package:edificiopage/edificio/components/edificio_carousel1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/edificio_carousel.dart';

class EdificioPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,// transparent status bar
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Stack(
        children:[
          _teste1,
          LeadingButton(
            icon: AnimatedIcons.arrow_menu, 
            setRoute: (context) { Scaffold.of(context).showSnackBar(SnackBar(content: Text('voltar'),));},
          ),
        ]   
      ),
    );
    
    
  }
}

ListView _teste2 = ListView(
  padding: EdgeInsets.zero,
  children:[
    Align(
      alignment: Alignment.topCenter,
      child: EdificioCarousel()
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1946-1976', style: TextStyle(fontWeight: FontWeight.w200),),
          Text('Estação Rodoviária Municipal', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
          SizedBox(height:50),
          Text(
            '''Passados quase um século de sua edifi-cação, a igreja foi demolida com a autorização da Cúria, no ano de 1943 e, no local, teve início a construção de um prédio para abrigar a Estação Rodoviá-ria da cidade, em estilo neocolonial, de planta regular, alongada no sentido norte-sul, de dois pavimentos, possuindo platibanda arrematadas com telhas cerâmicas tipo capa-e-canal. 
O andar do térreo foi construído nos limites do terreno e, hoje, seus vãos originais estão emparedados, o andar superior possui planta em forma de “T”. Ambos os andares possuem platibanda, sendo que a fachada norte do andar superior é coroada com um frontão arqueado na maneira corrente da época. Os interiores não apresentam a configuração original, possuem divisórias provisórias em ambos os andares.
            '''
          ),
        ],
      ),
    ),
    SizedBox(height: 50),
    EdificioCarouselS(),
  ],
    


);

ListView _teste1 = ListView(
  padding: EdgeInsets.zero,
  children:[
    Align(
      alignment: Alignment.topCenter,
      child: EdificioCarousel()
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1946-1976', style: TextStyle(fontWeight: FontWeight.w200),),
          Text('Estação Rodoviária Municipal', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
          SizedBox(height:50),
          Text(
            '''Passados quase um século de sua edifi-cação, a igreja foi demolida com a autorização da Cúria, no ano de 1943 e, no local, teve início a construção de um prédio para abrigar a Estação Rodoviá-ria da cidade, em estilo neocolonial, de planta regular, alongada no sentido norte-sul, de dois pavimentos, possuindo platibanda arrematadas com telhas cerâmicas tipo capa-e-canal. 
O andar do térreo foi construído nos limites do terreno e, hoje, seus vãos originais estão emparedados, o andar superior possui planta em forma de “T”. Ambos os andares possuem platibanda, sendo que a fachada norte do andar superior é coroada com um frontão arqueado na maneira corrente da época. Os interiores não apresentam a configuração original, possuem divisórias provisórias em ambos os andares.
            '''
          ),
        ],
      ),
    ),
    SizedBox(height: 50),
    EdificioCarouselS(),
  ],
    


);