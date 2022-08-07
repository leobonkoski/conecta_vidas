// replace this function with the code in the examples
import 'package:blid/modules/telasInfomacoes/Contatos/Contatos.dart';
import 'package:blid/modules/telasInfomacoes/Doa%C3%A7%C3%A3o%20de%20Medula/DoacaoMedula.dart';
import 'package:blid/modules/telasInfomacoes/Documentos/documentos.dart';
import 'package:blid/modules/telasInfomacoes/Impedimentos%20Definitivos/impedimentosDefinitivos.dart';
import 'package:blid/modules/telasInfomacoes/Impedimentos%20Tempor%C3%A1rios/impedimentosTemporarios.dart';
import 'package:blid/modules/telasInfomacoes/Orienta%C3%A7%C3%B5es%20p%C3%B3s%20Doa%C3%A7%C3%A3o/orientacoesPosDoacao.dart';
import 'package:blid/modules/telasInfomacoes/Requisitos%20Basicos/requisitosBasicos.dart';
import 'package:blid/modules/telasInfomacoes/Sobre%20n%C3%B3s/Sobre.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';

double TamImagem = 44;
double MarginBottom = 5;
double MarginLados = 10;

Widget listViewInformacoes(BuildContext context) {
  return ListView(children: <Widget>[
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.only(
            bottom: MarginBottom, left: MarginLados, right: MarginLados),
        child: Card(
          child: ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: TamImagem,
                minHeight: TamImagem,
                maxWidth: TamImagem,
                maxHeight: TamImagem,
              ),
              child: Image.asset(AppImages.blood, fit: BoxFit.cover),
            ),
            title: Text('Requisitos Básicos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => requisitosBasicos()),
              );
            },
          ),
        ),
      ),
    ),
    Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: MarginBottom, left: MarginLados, right: MarginLados),
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: TamImagem,
              minHeight: TamImagem,
              maxWidth: TamImagem,
              maxHeight: TamImagem,
            ),
            child: Image.asset(AppImages.BloodTest, fit: BoxFit.cover),
          ),
          title: Text('Impedimentos Temporários'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => impedimentosTemporarios()),
            );
          },
        ),
      ),
    ),
    Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: MarginBottom, left: MarginLados, right: MarginLados),
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: TamImagem,
              minHeight: TamImagem,
              maxWidth: TamImagem,
              maxHeight: TamImagem,
            ),
            child: Image.asset(AppImages.BloodBag, fit: BoxFit.cover),
          ),
          title: Text('Impedimentos Definitivos'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => impedimentosDefinitivos()),
            );
          },
        ),
      ),
    ),
    Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: MarginBottom, left: MarginLados, right: MarginLados),
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: TamImagem,
              minHeight: TamImagem,
              maxWidth: TamImagem,
              maxHeight: TamImagem,
            ),
            child: Image.asset(AppImages.RedCells, fit: BoxFit.cover),
          ),
          title: Text('Orientações pós Doação'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => orientacoesPosDoacao()),
            );
          },
        ),
      ),
    ),
    Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: MarginBottom, left: MarginLados, right: MarginLados),
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: TamImagem,
              minHeight: TamImagem,
              maxWidth: TamImagem,
              maxHeight: TamImagem,
            ),
            child: Image.asset(AppImages.medule, fit: BoxFit.cover),
          ),
          title: Text('Doação de Medula'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DoacaoMedula()),
            );
          },
        ),
      ),
    ),
    Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: MarginBottom, left: MarginLados, right: MarginLados),
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: TamImagem,
              minHeight: TamImagem,
              maxWidth: TamImagem,
              maxHeight: TamImagem,
            ),
            child: Image.asset(AppImages.Writing, fit: BoxFit.cover),
          ),
          title: Text('Documentos'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Documentos()),
            );
          },
        ),
      ),
    ),
    Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.only(
          bottom: MarginBottom, left: MarginLados, right: MarginLados),
      child: Card(
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: TamImagem,
              minHeight: TamImagem,
              maxWidth: TamImagem,
              maxHeight: TamImagem,
            ),
            child: Image.asset(AppImages.Contacts, fit: BoxFit.cover),
          ),
          title: Text('Contatos'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Contatos()),
            );
          },
        ),
      ),
    ),
  ]);
}
