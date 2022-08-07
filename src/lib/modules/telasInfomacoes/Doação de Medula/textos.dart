import 'package:flutter/material.dart';

// ViewList Doacao de Medúla
Widget DoacaoMedulaText(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          title: Text(
            'SAIBA MAIS SOBRE DOAÇÃO DE MEDULA ÓSSEA',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
              ' 1 em 100 mil Essa é a chance de se encontrar uma medula óssea compatível com a de outra pessoa no Brasil.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
              ' Você sabia que a doação de Medula Óssea é um dos procedimentos mais simples entre as doações e que você pode salvar uma vida? O transplante de medula óssea é a esperança de cura para milhares de portadores de leucemias e outras doenças do sangue.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
            'COMO SE TORNAR UM DOADOR',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
              ' 1. Você precisa ter entre 18 e 55 anos e estar em bom estado de saúde.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(' 2.  Colher um simples exame de sangue para tipagem.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
              ' 3.  Seu sangue será tipado, é um teste de laboratório para identificar sua tipagem HLA.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
              ' 4. Sua tipagem HLA será cadastrada no Registro Nacional de Doadores Voluntários de Medula Óssea (REDOME).'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
              ' 5.  Quando aparecer um paciente com uma medula compatível com a sua, você será chamado.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          title: Text(
              ' 6.  Novos testes sanguíneos serão necessários para a confirmação da compatibilidade.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0, bottom: 30.0),
        child: ListTile(
          title: Text(
              ' 7.  Se a compatibilidade for confirmada, você será consultado para decidir a doação.'),
        ),
      ),
    ],
  );
}
