import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';

// ViewList Doacao de Medúla
Widget ContatosSemLoginText(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return ListView(
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40, left: 0, right: 0),
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
                child: Image.asset(AppImages.flag_sp, width: 60, height: 50),
                padding: EdgeInsets.all(5),
              ),
              RichText(
                text: TextSpan(
                  text: 'HEMONÚCLEO',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 7.20,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nHospital de base de Bauru',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5.20,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 265,
                  height: 40,
                  child: Text(
                    "Telefone: (14) 3231-4771",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff5a5a5a),
                      fontSize: 14,
                      letterSpacing: 2.10,
                    ),
                  ),
                ),
                SizedBox(
                    width: 285,
                    height: 40,
                    child: Text(
                      "hemonucleo.hb@famesp.org.br",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff5a5a5a),
                        fontSize: 13,
                        letterSpacing: 1.95,
                      ),
                    )),
                SizedBox(
                  width: 265,
                  height: 50,
                  child: Text(
                    "R. Monsenhor Claro, 8-88 \n Centro, Bauru - SP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff5a5a5a),
                      fontSize: 13,
                      letterSpacing: 1.95,
                    ),
                  ),
                ),
                SizedBox(
                  width: 265,
                  height: 60,
                  child: Text(
                    "Horário de Atendimento:\n Segunda a sexta \n07:00–11:30, 13:00–15:30",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff5a5a5a),
                      fontSize: 13,
                      letterSpacing: 1.95,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image(
                    image: AssetImage(AppImages.conecta_vidas_logo),
                    width: 200,
                    height: 40,
                  ),
                ),
                SizedBox(
                    width: 285,
                    height: 40,
                    child: Text(
                      "tcc.careon@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff5a5a5a),
                        fontSize: 13,
                        letterSpacing: 1.95,
                      ),
                    )),
                SizedBox(
                    width: 285,
                    height: 40,
                    child: Text(
                      "projetos.ti@famesp.org.br",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff5a5a5a),
                        fontSize: 13,
                        letterSpacing: 1.95,
                      ),
                    )),
              ],
            ),
          )),
    ],
  );
}
