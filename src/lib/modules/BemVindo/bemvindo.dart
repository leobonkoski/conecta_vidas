import 'package:blid/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'Login/login.dart';
import 'Registro/registro.dart';
import 'package:blid/shared/themes/app_colors.dart';

class TelaBemVindo extends StatefulWidget {
  const TelaBemVindo({Key? key}) : super(key: key);

  @override
  _TelaBemVindoState createState() => _TelaBemVindoState();
}

class _TelaBemVindoState extends State<TelaBemVindo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Text("\n"),
              Image.asset(AppImages.Doctors),
              Text("\n"),
              Text(
                "BEM VINDO(A)!",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontbemvindo,
                ),
              ),
              Text(
                "\nBem vindo(a) ao aplicativo Conecta Vidas. \nComeçe informando se já é doador ou se deseja se cadastrar no aplicativo.\n",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xff414141),
                  fontSize: 16,
                  letterSpacing: 3.20,
                ),
              ),
              Text("\n"),
              ElevatedButton(
                child: Text(
                  'Já sou doador',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
              Text('\t'),
              ElevatedButton(
                child: Text(
                  'Quero ser doador',
                  style: TextStyle(color: AppColors.fontregistro, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonregistro,
                  minimumSize: Size(244, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registro()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
