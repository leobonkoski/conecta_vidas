import 'package:blid/modules/menuLateral/menu_lateral.dart';
import 'package:blid/modules/telasInfomacoes/Impedimentos%20Definitivos/textos.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class impedimentosDefinitivos extends StatefulWidget {
  const impedimentosDefinitivos({Key? key}) : super(key: key);

  @override
  _TelaIinicialState createState() => _TelaIinicialState();
}

class _TelaIinicialState extends State<impedimentosDefinitivos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('IMPEDIMENTOS DEFINITIVOS',
            style: TextStyle(color: AppColors.azulEscuro)),
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
    return impedimentosDefinitivosText(context);
  }
}
