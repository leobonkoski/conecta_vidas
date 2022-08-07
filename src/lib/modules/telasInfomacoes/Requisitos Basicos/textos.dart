import 'package:flutter/material.dart';

// ViewList Requisitos Basicos
Widget RequisitosBasicosText(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          title: Text(
            'CONHEÇA OS REQUISITOS BÁSICOS PARA DOAÇÃO DE SANGUE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('Sentir-se bem, com saúde;'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('Ter entre 16 e 69 anos de idade'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('O limite para a primeira doação é de 60 anos;'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('Pesar acima de 50 kg.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Doação de sangue com idade de 16 (dezesseis) e 17 (dezessete) anos, com a presença e o consentimento formal dos pais'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Apresentar documento com foto, emitido por órgão oficial e válido em todo o território nacional'),
        ),
      ),
    ],
  );
}
