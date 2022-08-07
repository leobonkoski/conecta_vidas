import 'package:blid/modules/menuLateral/menu_lateral.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'textos.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  _TelaIinicialState createState() => _TelaIinicialState();
}

class _TelaIinicialState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('SOBRE NÓS', style: TextStyle(color: AppColors.azulEscuro)),
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
    return SobreText(context);
  }
}
