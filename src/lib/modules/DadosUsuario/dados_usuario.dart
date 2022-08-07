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
import 'package:shared_preferences/shared_preferences.dart';

String _credencialU = '';
String _credencialS = '';
String _credencial_nOMEDOA = '';
String _credencial_dATANASC = '';
String _credencial_gRABO = '';
String _credencial_fATORRH = '';
String _credencial_eMAIL = '';
String _credencial_fONE2 = '';
String _credencial_cPF = '';
String _credencial_dOACAO = '';
String _credencial_fONER = '';
String _credencial_sEXO = '';

class TelaDadosUsuario extends StatefulWidget {
  @override
  _TelaDadosUsuario createState() => _TelaDadosUsuario();
}

class _TelaDadosUsuario extends State<TelaDadosUsuario> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  /// Função que carrega os dados do usuário e a data de sua ultima doação de sangue vindos da requisição da api na tela de login ///
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _credencial_nOMEDOA = (prefs.getString('credencial_nOMEDOA') ?? '');
      _credencial_dATANASC = (prefs.getString('credencial_dATANASC') ?? '');
      _credencial_gRABO = (prefs.getString('credencial_gRABO') ?? '');
      _credencial_fATORRH = (prefs.getString('credencial_fATORRH') ?? '');
      _credencial_eMAIL = (prefs.getString('credencial_eMAIL') ?? '');
      _credencial_fONER = (prefs.getString('credencial_fONER') ?? '');
      _credencial_fONE2 = (prefs.getString('credencial_fONE2') ?? '');
      _credencial_cPF = (prefs.getString('credencial_cPF') ?? '');
      _credencial_dOACAO = (prefs.getString('credencial_dOACAO') ?? '');
      _credencial_sEXO = (prefs.getString('credencial_sEXO') ?? '');
    });
  }

  Widget build(BuildContext context) {
    /// Formatação de datas de nascimento e de ultima doação de sangue ///
    final dataDoacaoFormatada =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_credencial_dOACAO));
    final dataNascimentoFormatada =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_credencial_dATANASC));

    /// Formatação do tipo de sanguineo do usuário ///
    var fatorRH = '';
    _credencial_fATORRH == 'P' ? fatorRH = '+' : fatorRH = '-';
    final size = MediaQuery.of(context).size;

    return Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(
          title: Text('DADOS DO USUÁRIO',
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
          child: Stack(children: <Widget>[
            Positioned(
              top: size.height * 0.05,
              left: 0,
              right: 0,
              child: Container(
                  width: 170.0,
                  height: 170.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(AppImages.user_avatar)))),
            ),
            Positioned(
                top: size.height * 0.30,
                left: 0,
                right: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 70, right: 70),
                        child: Text(
                          _credencial_nOMEDOA,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff415678),
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 70, right: 70),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Text(
                          "DADOS PESSOAIS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff415678),
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ])),
            Positioned(
                top: size.height * 0.48,
                left: 0,
                right: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          "Nome Completo",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xc953a9f8),
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.50,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        margin: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(188, 222, 253, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 3,
                          ),
                          child: Text(
                            _credencial_nOMEDOA,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff8095aa),
                              fontSize: 12,
                              letterSpacing: 1.20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          "E-MAIL",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xc953a9f8),
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.50,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        margin: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(188, 222, 253, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 3,
                          ),
                          child: Text(
                            _credencial_eMAIL,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff8095aa),
                              fontSize: 12,
                              letterSpacing: 1.20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          "CPF",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xc953a9f8),
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.50,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        margin: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(188, 222, 253, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 3,
                          ),
                          child: Text(
                            _credencial_cPF,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff8095aa),
                              fontSize: 12,
                              letterSpacing: 1.20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          "Telefone 1",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xc953a9f8),
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.50,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        margin: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(188, 222, 253, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 3,
                          ),
                          child: Text(
                            _credencial_fONER,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff8095aa),
                              fontSize: 12,
                              letterSpacing: 1.20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          "Telefone 2",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xc953a9f8),
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.50,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        margin: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(188, 222, 253, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 3,
                          ),
                          child: Text(
                            _credencial_fONE2,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff8095aa),
                              fontSize: 12,
                              letterSpacing: 1.20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: Text(
                          "Data de Nascimento",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xc953a9f8),
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.50,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.90,
                        margin: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(188, 222, 253, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 3,
                          ),
                          child: Text(
                            dataNascimentoFormatada,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff8095aa),
                              fontSize: 12,
                              letterSpacing: 1.20,
                            ),
                          ),
                        ),
                      ),
                    ])),
            Text("\n"),
            Positioned(
              top: size.height * 0.82,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: Text(
                      "CARTEIRA DE VACINAÇÃO",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff415678),
                        fontSize: 15,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.90,
                    height: size.height * 0.10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffbcdefd),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, bottom: 4.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Tipo Sanguínio:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff415678),
                                      fontSize: 15,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.50,
                                    ),
                                  ),
                                  Text(
                                    "Ùltima Doação:",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff415678),
                                      fontSize: 15,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.50,
                                    ),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 5.0, bottom: 4.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _credencial_gRABO + ' ' + fatorRH,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.50,
                                    ),
                                  ),
                                  Text(
                                    dataDoacaoFormatada,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.50,
                                    ),
                                  ),
                                ]),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ]),
        )));
  }
}
