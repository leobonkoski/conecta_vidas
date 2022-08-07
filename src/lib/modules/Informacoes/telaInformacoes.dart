import 'package:blid/modules/Informacoes/listViewInformacoes.dart';
import 'package:blid/modules/menuLateral/menu_lateral.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(Informacoes());

class Informacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('I N F O R M A Ç Õ E S',
            style: TextStyle(color: AppColors.azulEscuro)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.widgets,
        toolbarHeight: 71,
      ),
      body: Scaffold(
        //appBar: AppBar(title: Text('ListViews')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return listViewInformacoes(context);
  }
}
