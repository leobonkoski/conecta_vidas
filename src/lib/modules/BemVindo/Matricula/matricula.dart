import 'package:blid/modules/BemVindo/Login/login.dart';
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
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:blid/modules/BemVindo/bemvindo.dart';
import 'package:blid/modules/DadosUsuario/dados_usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var verificaLogin = prefs.getString('credencialU');

  runApp(MaterialApp(localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ], supportedLocales: [
    const Locale('pt', 'BR')
  ], home: TelaMatricula()));
}

class TelaMatricula extends StatefulWidget {
  @override
  createState() => _TelaMatriculaState();
}

class _TelaMatriculaState extends State {
  @override
  var _email = '';
  var matricula = '';
  var users = <Usuario>[];
  var userLogin = new TextEditingController();
  var userBirth = new TextEditingController();
  var userEmail = new TextEditingController();

  /// Função de envio de e-mail com número da matricula utilizando a api do EmailJS ///
  Future sendEmail({
    required String user_nome,
    required String user_email,
    required String user_matricula,
  }) async {
    final serviceId = 'service_z3lju8j';
    final templateId = 'template_qs31dgj';
    final userId = 'user_0RZ8emxFDyanfG0KzUT9h';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': user_nome,
            'user_mat': user_matricula,
            'user_mail': user_email
          }
        }));
  }

  /// Chamada da api para recuperar o número de matricula ///
  _getJSONData(String user, String birth) {
    if (user != '' && birth != '') {
      List<String> list = birth.split("/");
      print("list");

      String dia = list[0];
      String mes = list[1];
      String ano = list[2];

      List<String> data = [list[2], list[1], list[0]];

      var data_formatada = data.join("-");

      API.getMatricula(user, data_formatada).then((response) {
        setState(() {
          Iterable list = json.decode(response.body);

          if (list.length == 0) {
            alertaDadosIncorretos(context);
          } else {
            users = list.map((model) => Usuario.fromJson(model)).toList();
            matricula = users[0].mATRIC;
            alertaDadosCorretos(context);

            /// Chamada da função de envio de e-mail ///
            sendEmail(
                user_nome: users[0].nOMEDOA,
                user_email: userEmail.text,
                user_matricula: users[0].mATRIC);

            print(users[0].nOMEDOA);
          }
        });
      });
    } else {
      alertaDadosFaltando(context);
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

  /// Mensagem de Dados Corretos e o numero da matricula ///
  alertaDadosCorretos(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text("Dados corretos. A sua matricula é $matricula"),
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
                "\n\n\nRECUPERAR\n MATRÍCULA",
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
                controller: userBirth,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  icon: Icon(Icons.person_outline),
                ),
                keyboardType: TextInputType.datetime,
                onTap: () {
                  /// Função de pegar data ///
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1920, 1),
                      lastDate: DateTime(2050, 12),
                      builder: (context, picker) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: AppColors.tituloGrande,
                              onPrimary: Colors.white,
                              surface: AppColors.tituloGrande,
                              onSurface: AppColors.loremIpsum,
                            ),
                            dialogBackgroundColor: AppColors.background,
                          ),
                          child: picker!,
                        );
                      }).then((selectedDate) {
                    if (selectedDate != null) {
                      var date = DateFormat("dd/MM/yyyy").format(selectedDate);
                      userBirth.text = date;
                    }
                  });
                },
              ),
              TextFormField(
                controller: userEmail,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  icon: Icon(Icons.person_outline),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Text("\n\n\n"),
              ElevatedButton(
                  child: Text(
                    'Enviar',
                    style: TextStyle(color: AppColors.fontlogin, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.buttonlogin,
                    minimumSize: Size(244, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    print(userBirth.text);
                    _getJSONData(userLogin.text, userBirth.text);
                  }),
              InkWell(
                onTap: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new Login(),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text(
                  "\n\n Voltar para o Login",
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
