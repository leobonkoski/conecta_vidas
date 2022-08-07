import 'package:blid/modules/BemVindo/Login/login.dart';
import 'package:blid/modules/telasInfomacoes/Contatos_Sem_Login/Contatos.dart';
import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:blid/shared/themes/app_colors.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _Registro createState() => _Registro();
}

class _Registro extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Text(
                "\n\n\nREGISTRE-SE NO \n  HEMONÚCLEO\n",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontbemvindo,
                ),
              ),
              Text(
                "O Conecta Vidas é um aplicativo destinado a quem já possui um cadastro no Hemonúcleo de Bauru.\n\nCaso não possua um cadastro e queira se registrar como doador, entre em contato para mais informações.\nDoar sangue é um ato de amor e esperança.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xff414141),
                  fontSize: 16,
                  letterSpacing: 3.20,
                ),
              ),
              Text("\n"),
              Text("\n\n\n"),
              ElevatedButton(
                  child: Text(
                    'Entre em contato',
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
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new ContatosSemLogin(),
                    );
                    Navigator.of(context).push(route);
                  }

                  //  verificaDados(userLogin.text, userPass.text),
                  ),
              InkWell(
                onTap: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new Login(),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text(
                  "\n\n Voltar para Login",
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
