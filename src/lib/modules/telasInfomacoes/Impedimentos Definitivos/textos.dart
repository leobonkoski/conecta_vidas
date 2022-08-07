import 'package:flutter/material.dart';

/// Contéudo da tela Impedimentos Definitivos ///
Widget impedimentosDefinitivosText(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          title: Text(
            'SAIBA O QUE PODE TE IMPEDIR PERMANENTEMENTE DE FAZER UMA DOAÇÃO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Quem teve diagnóstico de hepatite após os 11 anos de idade;'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Pessoas que estão expostas a doenças transmissíveis pelo sangue, como aids, hepatite, sífilis e doença de chagas;'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('Usuários de drogas;'),
        ),
      ),
    ],
  );
}
