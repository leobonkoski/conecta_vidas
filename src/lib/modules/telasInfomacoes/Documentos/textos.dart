import 'dart:io';

import 'package:blid/shared/themes/app_images.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';

/// Contéudo da tela Documentos ///
Widget DocumentosText(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 30.0, top: 20.0),
      ),
      Card(
          child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          /// Chamada da função que abre o pdf. ///
          openFile(
            url:
                'http://192.168.0.2/flutter/documentos/consentimento_menor_idade.pdf',
          );
        },
        child: ListTile(
          leading: SizedBox(
              height: 40, width: 40, child: Image.asset(AppImages.documents)),
          title: Text("Consentimento menor de idade.",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
      )),
      Card(
          child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          /// Chamada da função que abre o pdf. ///
          openFile(
            url: 'http://192.168.0.2/flutter/documentos/orientacao_doador.pdf',
          );
        },
        child: ListTile(
          leading: SizedBox(
              height: 40, width: 40, child: Image.asset(AppImages.documents)),
          title: Text("Orientações ao doador.",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
      )),
      Card(
          child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          openFile(
            /// Chamada da função que abre o pdf. ///
            url: 'http://192.168.0.2/flutter/documentos/doacao_sangue.pdf',
          );
        },
        child: ListTile(
          leading: SizedBox(
              height: 40, width: 40, child: Image.asset(AppImages.documents)),
          title: Text("Tudo o que você precisa saber sobre doação de sangue.",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
      )),
      Card(
          child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          /// Chamada da função que abre o pdf. ///
          openFile(
            url: 'http://192.168.0.2/flutter/documentos/doacao_medula.pdf',
          );
        },
        child: ListTile(
          leading: SizedBox(
              height: 40, width: 40, child: Image.asset(AppImages.documents)),
          title: Text(
              "Tudo o que você precisa saber sobre doação de medula óssea.",
              style: TextStyle(fontSize: 18.0, color: Colors.black)),
        ),
      )),
    ],
  );
}

/// Função que abre o pdf. ///
Future openFile({required String url, String? fileName}) async {
  final name = fileName ?? url.split('/').last;
  final file = await downloadFile(url, name);
  if (file == null) return;
  print('Path: ${file.path}');
  OpenFile.open(file.path);
}

/// Função que carrega o pdf vindo direto do servidor. ///
Future<File?> pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) return null;
  return File(result.files.first.path!);
}

/// Função que faz o download do pdf para um diretório da aplicação ///
Future<File?> downloadFile(String url, String? name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  Directory dir = Directory('/storage/emulated/0/Download');
  final file = File('${appStorage.path}/$name');

  try {
    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: 0,
      ),
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  } catch (e) {
    return null;
  }
}
