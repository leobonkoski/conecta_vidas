import 'package:blid/modules/BemVindo/bemvindo.dart';
import 'package:blid/modules/Informacoes/telaInformacoes.dart';
import 'package:blid/modules/telaInicial/telaInicial.dart';
import 'package:blid/modules/BemVindo/Login/login.dart';
import 'package:blid/modules/telasInfomacoes/Requisitos%20Basicos/requisitosBasicos.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ConectaVidasApp());
}

/// Root da aplicação ///
class ConectaVidasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Splash(),
    );
  }
}

/// Criação da Splash Page ///
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TelaBemVindo()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.splash_image)))),
      ),
    );
  }
}
