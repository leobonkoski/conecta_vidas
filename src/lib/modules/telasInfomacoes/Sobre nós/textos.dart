import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';

/// Contéudo da tela Sobre Nós ///
Widget SobreText(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 30.0, top: 20),
        child: ListTile(
          title: Text(
              'Pensando em auxiliar o processo de doação e converter a população em mais doadores.',
              style: TextStyle(
                color: Color(0xff414141),
                fontSize: 16,
                letterSpacing: 3.20,
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0, top: 10),
        child: ListTile(
          title: Row(
            children: <Widget>[
              (Image.asset(
                AppImages.care_on_logo,
                width: 130,
                height: 25,
              )),
              Text(
                '   uma empresa\n   focada em levar\n   soluções para a \n   vida através da\n   computação.',
                style: TextStyle(
                  color: Color(0xff414141),
                  fontSize: 16,
                  letterSpacing: 3.20,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0, top: 10),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Text('Criou o  ',
                  style: TextStyle(
                    color: Color(0xff414141),
                    fontSize: 16,
                    letterSpacing: 3.20,
                  )),
              (Image.asset(
                AppImages.conecta_vidas_logo,
                width: 130,
                height: 25,
              )),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0, top: 10),
        child: ListTile(
          title: Text(
            'Um aplicativo voltado para doadores do hemonúcleo de Bauru, feito para transformar esse ato heróico em uma experiência completamente fácil e tranquila.',
            style: TextStyle(
              color: Color(0xff414141),
              fontSize: 16,
              letterSpacing: 3.20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30, top: 10),
        child: ListTile(
          title: Text(
              'Armazenando informações e documentações necessárias para doação no seu aparelho smartphone.',
              style: TextStyle(
                color: Color(0xff414141),
                fontSize: 16,
                letterSpacing: 3.20,
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0, top: 10),
        child: ListTile(
          title: Text(
              'Além de ser prático, o CO te informa a data para próxima doação e dá dicas incríveis de como ter uma vida saudável, além de mostrar várias outras informações importantes para uma doação segura.',
              style: TextStyle(
                color: Color(0xff414141),
                fontSize: 16,
                letterSpacing: 3.20,
              )),
        ),
      ),
    ],
  );
}
