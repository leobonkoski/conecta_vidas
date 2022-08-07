import 'package:blid/modules/DadosUsuario/usuario.dart';
import 'package:blid/shared/themes/app_colors.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';

/// Classe que faz a conexão com a api no servidor e faz as requisições de informações ///
class API {
  /// Função da api para requisição de dados de cadastro do usuário e a data de sua ultima doação de sangue ///
  static Future getJSONData(String user, String pass) async {
    var response = await get(
        Uri.parse(
            'http://192.168.0.2/flutter/api/usuarios.php?user=${user}&pass=${pass}'),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    return response;
  }

  /// Função da api para requisição do número de matricula do usuário ///
  static Future getMatricula(String user, String birth) async {
    var response = await get(
        Uri.parse(
            "http://192.168.0.2/flutter/api/matricula.php?user='${user}'&birth='${birth}'"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    return response;
  }

  /// Função da api para requisição de todas doações de sangue realizada pelo usuário ///
  static Future getDoacoes(String matric) async {
    var response = await get(
        Uri.parse(
            "http://192.168.0.2/flutter/api/doacoes.php?matric=${matric}"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });

    return response;
  }
}
