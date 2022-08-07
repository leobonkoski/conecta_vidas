import 'package:blid/modules/BemVindo/Login/login.dart';
import 'package:blid/modules/DadosUsuario/dados_usuario.dart';
import 'package:blid/modules/Historico/historico.dart';
import 'package:blid/modules/Informacoes/telaInformacoes.dart';
import 'package:blid/modules/Notificacoes/notificacoes.dart';
import 'package:blid/modules/telaInicial/telaInicial.dart';
import 'package:blid/modules/telasInfomacoes/Sobre%20n%C3%B3s/Sobre.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _credencial_nOMEDOA = '';

class MenuLateral extends StatefulWidget {
  @override
  _MenuLateral createState() => _MenuLateral();

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _MenuLateral extends State<MenuLateral> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  /// Função que carrega o nome do usuário vindo da requisição da api na tela de login ///
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credencial_nOMEDOA = (prefs.getString('credencial_nOMEDOA') ?? '');
    });
  }

  final padding = EdgeInsets.symmetric(horizontal: 1);
  @override
  Widget build(BuildContext context) {
    /// Função para separar o primeiro nome do usuário para ele ser carregado no menu lateral ///

    final separar_primeiro_nome = _credencial_nOMEDOA.split(' ');
    final Map<int, String> values = {
      for (int i = 0; i < separar_primeiro_nome.length; i++)
        i: separar_primeiro_nome[i]
    };
    final primeiro_nome = values[0];

    return Drawer(
      child: Material(
        color: AppColors.background,
        child: ListView(
          padding: padding,
          children: <Widget>[
            buildHeader(
              nome: primeiro_nome.toString(),
            ),
            const SizedBox(
              height: 28,
            ),
            buildMenuItem(
              text: 'TELA INICIAL',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            buildMenuItem(
              text: 'NOTIFICAÇÕES',
              icon: Icons.notifications,
              onClicked: () => selectedItem(context, 1),
            ),
            buildMenuItem(
              text: 'HISTÓRICO',
              icon: Icons.timer,
              onClicked: () => selectedItem(context, 2),
            ),
            buildMenuItem(
              text: 'INFORMAÇÕES',
              icon: Icons.info,
              onClicked: () => selectedItem(context, 3),
            ),
            buildMenuItem(
              text: 'SOBRE',
              icon: Icons.more,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(
              height: 200,
            ),
            buildMenuItem(
              text: 'SAIR',
              icon: Icons.exit_to_app,
              onClicked: () => selectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String nome,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          color: AppColors.widgets,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImages.user_avatar),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    nome,
                    style: TextStyle(fontSize: 20, color: AppColors.azulEscuro),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = AppColors.azulEscuro;
    final hoverColor = AppColors.widgets;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 20)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Future<void> selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => new TelaDadosUsuario(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Notificacoes(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Historico(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Informacoes(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Sobre(),
        ));
        break;
      case 5:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('credencialU');
        prefs.remove('credencial_nOMEDOA');
        prefs.remove('credencial_dATANASC');
        prefs.remove('credencial_gRABO');
        prefs.remove('credencial_fATORRH');
        prefs.remove('credencial_eMAIL');
        prefs.remove('credencial_fONER');
        prefs.remove('credencial_fONE2');
        prefs.remove('credencial_cPF');
        prefs.remove('credencial_dOACAO');
        prefs.remove('credencial_sEXO');
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Login(),
        ));
        break;
    }
  }
}
