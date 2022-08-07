import 'package:blid/modules/menuLateral/menu_lateral.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'textos.dart';

class Contatos extends StatefulWidget {
  const Contatos({Key? key}) : super(key: key);

  @override
  _TelaIinicialState createState() => _TelaIinicialState();
}

class _TelaIinicialState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('CONTATOS', style: TextStyle(color: AppColors.azulEscuro)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.widgets,
        toolbarHeight: 71,
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContatosText(context);
  }
}
