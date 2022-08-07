import 'package:blid/modules/DadosUsuario/usuario.dart';
import 'package:blid/modules/DadosUsuario/api.dart';
import 'package:blid/modules/menuLateral/menu_lateral.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:blid/modules/BemVindo/bemvindo.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _credencial_dOACAO = '';
String _credencial_sEXO = '';
bool? Option1;
bool? Option2;
bool? Option3;
bool? Option4;
bool? checkValue1 = false;
bool? checkValue2 = false;
bool? checkValue3 = false;
bool? checkValue4 = false;

void main() => runApp(Notificacoes());

class Notificacoes extends StatefulWidget {
  @override
  _Notificacoes createState() => _Notificacoes();
}

class _Notificacoes extends State<Notificacoes> {
  @override
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  /// Função que carrega o último estado das checkboxs, o gênero do usuário para o calculo da próxima data de doação de sangue e a data da ultima doação de sangue ///
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credencial_dOACAO = (prefs.getString('credencial_dOACAO') ?? '');
      _credencial_sEXO = (prefs.getString('credencial_sEXO') ?? '');
      Option1 = prefs.getBool('option1');
      Option2 = prefs.getBool('option2');
      Option3 = prefs.getBool('option3');
      Option4 = prefs.getBool('option4');
    });
    if (Option1 == true) {
      checkValue1 = true;
    }
    if (Option1 = false) {
      checkValue1 = false;
    }
    if (Option2 == true) {
      checkValue2 = true;
    }
    if (Option2 = false) {
      checkValue2 = false;
    }
    if (Option3 == true) {
      checkValue3 = true;
    }
    if (Option3 = false) {
      checkValue3 = false;
    }
    if (Option4 == true) {
      checkValue4 = true;
    }
    if (Option4 = false) {
      checkValue4 = false;
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataDoacaoFormatada =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_credencial_dOACAO));

    /// Função para calcular o período para uma próxima doação de sangue. ///
    var dataNovaDoacao = '';

    if (_credencial_sEXO == 'M') {
      DateTime dt =
          Jiffy(DateTime.parse(_credencial_dOACAO)).add(months: 2).dateTime;
      dataNovaDoacao = DateFormat("dd/MM/yyyy").format(dt);
    }
    ;

    if (_credencial_sEXO == 'F') {
      DateTime dt =
          Jiffy(DateTime.parse(_credencial_dOACAO)).add(months: 3).dateTime;
      dataNovaDoacao = DateFormat("dd/MM/yyyy").format(dt);
    }
    ;

    return Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(
          title: Text('NOTIFICAÇÕES',
              style: TextStyle(color: AppColors.azulEscuro)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.widgets,
          toolbarHeight: 71,
        ),
        body: SingleChildScrollView(
            child: Container(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: size.height * 0.03,
                        child: Container(
                          width: size.width,
                          height: size.height * 0.40,
                          child: Container(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(AppImages.arrow),
                                    height: 300,
                                    width: 250,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 95),
                                    child: Text(
                                      "ULTIMA DOAÇÃO",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff415678),
                                        fontSize: 12,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 60),
                                    child: Text(
                                      dataDoacaoFormatada,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff415678),
                                        fontSize: 12,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Container(
                                          width: 65,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(33, 109, 224,
                                                0.44999998807907104),
                                          ))),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Text(
                                      "PRÓXIMA DOAÇÃO",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff415678),
                                        fontSize: 12,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Text(
                                      dataNovaDoacao,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff415678),
                                        fontSize: 12,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(top: 20, left: 0, right: 0),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(AppImages.heart),
                              padding: EdgeInsets.only(right: 15),
                            ),
                            Text(
                              "DICAS PÓS DOAÇÃO",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Color(0xff19558c),
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                letterSpacing: 7.20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(top: 150, left: 0, right: 0),
                      child: Container(
                        width: size.width - (size.width * 0.08),
                        height: 65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 1),
                                blurRadius: 4)
                          ],
                          color: Color.fromRGBO(252, 252, 252, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Não fume após duas horas",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff19558c),
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.80,
                                    ),
                                  ),
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Checkbox(
                                    value: checkValue1,
                                    onChanged: (bool? value) async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.remove('option1');

                                      setState(() {
                                        checkValue1 = value;

                                        prefs.setBool('option1', checkValue1!);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(top: 285, left: 0, right: 0),
                      child: Container(
                        width: size.width - (size.width * 0.08),
                        height: 65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 1),
                                blurRadius: 4)
                          ],
                          color: Color.fromRGBO(252, 252, 252, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Não consuma bebidas\n alcoólicas por 6 horas",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff19558c),
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.80,
                                    ),
                                  ),
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Checkbox(
                                    value: checkValue2,
                                    onChanged: (bool? value) async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.remove('option2');

                                      setState(() {
                                        checkValue2 = value;

                                        prefs.setBool('option2', checkValue2!);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(top: 420, left: 0, right: 0),
                      child: Container(
                        width: size.width - (size.width * 0.08),
                        height: 65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 1),
                                blurRadius: 4)
                          ],
                          color: Color.fromRGBO(252, 252, 252, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Aguarde 12 horas antes de\n fazer exercícios físicos",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff19558c),
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.80,
                                    ),
                                  ),
                                  padding: EdgeInsets.only(right: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Checkbox(
                                    value: checkValue3,
                                    onChanged: (bool? value) async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.remove('option3');

                                      setState(() {
                                        checkValue3 = value;

                                        prefs.setBool('option3', checkValue3!);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(top: 555, left: 0, right: 0),
                      child: Container(
                        width: size.width - (size.width * 0.08),
                        height: 65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 1),
                                blurRadius: 4)
                          ],
                          color: Color.fromRGBO(252, 252, 252, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Mantenha comprensão\n no local da punção",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff19558c),
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.80,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 55),
                                  child: Checkbox(
                                    value: checkValue4,
                                    onChanged: (bool? value) async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.remove('option4');

                                      setState(() {
                                        checkValue4 = value;

                                        prefs.setBool('option4', checkValue4!);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ))));
  }
}
