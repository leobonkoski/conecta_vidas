import 'package:blid/modules/BemVindo/Matricula/matricula.dart';
import 'package:blid/modules/BemVindo/Registro/registro.dart';
import 'package:blid/modules/DadosUsuario/preferences.dart';
import 'package:blid/modules/DadosUsuario/usuario.dart';
import 'package:blid/modules/DadosUsuario/api.dart';
import 'package:blid/modules/telaInicial/telaInicial.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:blid/modules/BemVindo/bemvindo.dart';
import 'package:blid/modules/DadosUsuario/dados_usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var verificaLogin = prefs.getString('credencial_cPF');

  print(verificaLogin);
  runApp(MaterialApp(
      home: verificaLogin == null ? Login() : new TelaDadosUsuario()));
}

class Login extends StatefulWidget {
  @override
  createState() => _LoginState();
}

class _LoginState extends State {
  @override
  var _email = '';
  var usuario = '';
  var senha = '';
  var nome = '';
  var users = <Usuario>[];
  var userLogin = new TextEditingController();
  var userPass = new TextEditingController();

  /// Chamada da api para efetuar o login ///
  _getJSONData(String user, String pass) {
    if (user != '' && pass != '') {
      print(user);
      API.getJSONData(user, pass).then((response) {
        setState(() {
          Iterable list = json.decode(response.body);

          if (list.length == 0) {
            usuario = 'error';
            senha = 'error';
          } else {
            users = list.map((model) => Usuario.fromJson(model)).toList();
            usuario = users[0].cPF;
            senha = users[0].mATRIC;
          }
        });

        verificaDados(user, pass);
      });
    } else {
      alertaDadosFaltando(context);
    }
  }

  /// Função de verificação de consistencia de dados e que salva os dados do usuário no aplicativo ///
  verificaDados(
    String user,
    String pass,
  ) async {
    if (user == usuario && pass == senha) {
      print(users[0].nOMEDOA);

      /// Confirugando variaveis para receberem os dados de usuário e esses dados poderem ser utilizados em outras telas ///
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('credencial_nOMEDOA', users[0].nOMEDOA);
      prefs.setString('credencial_fONER', users[0].fONER);
      prefs.setString('credencial_dATANASC', users[0].dATANASC);
      prefs.setString('credencial_gRABO', users[0].gRABO);
      prefs.setString('credencial_fATORRH', users[0].fATORRH);
      prefs.setString('credencial_eMAIL', users[0].eMAIL);
      prefs.setString('credencial_fONE2', users[0].fONE2);
      prefs.setString('credencial_cPF', users[0].cPF);
      prefs.setString('credencial_dOACAO', users[0].dOACAO);
      prefs.setString('credencial_sEXO', users[0].sEXO);
      prefs.setString('credencial_mATRIC', users[0].mATRIC);

      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new TelaDadosUsuario(),
      );
      Navigator.of(context).push(route);
    } else {
      alertaDadosIncorretos(context);
    }
  }

  /// Mensagem de Dados Incorretos ///
  alertaDadosIncorretos(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text("Dados incorretos."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /// Mensagem de Dados Faltando ///
  alertaDadosFaltando(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text("Preencha os campos."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              Text(
                "\n\n\nFAÇA SEU LOGIN",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontbemvindo,
                ),
              ),
              Text("\n"),
              TextFormField(
                controller: userLogin,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  labelText: 'CPF',
                  icon: Icon(Icons.person_outline),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: userPass,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  labelText: 'N° de matrícula',
                  icon: Icon(Icons.lock_outline),
                ),
                keyboardType: TextInputType.number,
              ),
              Text("\n\n\n"),
              ElevatedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(color: AppColors.fontlogin, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.buttonlogin,
                    minimumSize: Size(244, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('credencialU', userLogin.text);
                    _getJSONData(userLogin.text, userPass.text);
                  }),
              InkWell(
                onTap: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new TelaMatricula(),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text(
                  "\n\n Recuperar o n° de matrícula",
                  style: TextStyle(
                    color: AppColors.fontregistro,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "\n \nNão é cadastrado no hemonúcleo?",
                style: TextStyle(
                  color: AppColors.fontlogin,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new Registro(),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text(
                  "Saiba como se cadastrar!",
                  style: TextStyle(
                    color: AppColors.fontregistro,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
