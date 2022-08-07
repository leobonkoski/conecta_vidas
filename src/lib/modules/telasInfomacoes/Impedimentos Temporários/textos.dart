import 'package:flutter/material.dart';

/// Contéudo da tela Impedimentos Temporários ///
Widget impedimentosTemporariosText(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          title: Text(
            'SAIBA O QUE PODE TE IMPEDIR TEMPORARIAMENTE DE FAZER UMA DOAÇÃO',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('Mulheres grávidas ou que estejam amamentando;'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Aqueles que tiveram relacionamento sexual com múltiplos parceiros nos últimos 12 meses;'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Piercing”, tatuagem ou maquiagem definitiva 12 (doze) meses após realização; devido não ser possível avaliar as condições de segurança do procedimento realizado; se na cavidade oral e/ou na região genital, devido ao risco permanente de infecção, a inaptidão é 12 (doze) meses da retirada.'),
        ),
      ),
    ],
  );
}
