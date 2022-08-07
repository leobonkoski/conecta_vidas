import 'package:blid/modules/DadosUsuario/usuario.dart';
import 'package:blid/modules/DadosUsuario/api.dart';
import 'package:blid/modules/menuLateral/menu_lateral.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:blid/modules/BemVindo/bemvindo.dart';
import 'package:shared_preferences/shared_preferences.dart';

String credencial_mATRIC = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var verificaLogin = prefs.getString('credencialU');

  runApp(MaterialApp(localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ], supportedLocales: [
    const Locale('pt', '')
  ], home: Historico()));
}

class Historico extends StatefulWidget {
  @override
  _Historico createState() => _Historico();
}

class _Historico extends State<Historico> {
  var users = <Usuario>[];
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  /// Função que carrega o número de matricula vindo da tela de login para fazer a requisição com a api que busca a lista de doações de sangue do usuário ///
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      credencial_mATRIC = (prefs.getString('credencial_mATRIC') ?? '');
    });
    _getJSONData(
        credencial_mATRIC); // requisição da api utilizando número de matricula vindo da tela de login
  }

  /// Chamada da api para buscar a lista de doações de sangue do usuário ///
  _getJSONData(String matric) {
    print(matric);
    API.getDoacoes(matric).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);

        if (list.length == 0) {
        } else {
          users = list.map((model) => Usuario.fromJson(model)).toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(
          title: Text('HISTÓRICO DE DOAÇÕES',
              style: TextStyle(color: AppColors.azulEscuro)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.widgets,
          toolbarHeight: 71,
        ),
        body: listaDoacoes());
  }

  /// Função que constrói na tela a listagem de doações de sangue ///
  listaDoacoes() {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  child: ListTile(
                leading: SizedBox(
                    height: 60,
                    width: 60, // fixed width and height
                    child: Image.asset(AppImages.BloodBag)),
                title: Text(
                    DateFormat("dd/MM/yyyy")
                        .format(DateTime.parse(users[index].dOACAO)),
                    style: TextStyle(fontSize: 18.0, color: Colors.black)),
                subtitle: Text('Tipo Sanguineo:' +
                    " " +
                    users[index].gRABO +
                    (users[index].fATORRH == 'P' ? " +" : ' -')),
              ))
            ]);
      },
    );
  }
}
