import 'package:flutter/material.dart';

/// Contéudo da tela Orientações pós doação ///
Widget orientacoesPosDoacaoText(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          title: Text(
            'ENTENDA O QUE DEVE OU NÃO FAZER APÓS SUA DOAÇÃO DE SANGUE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('Não fume 02 horas após a doação.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Não faça uso de bebida alcoólica por um período de 16 horas após a doação.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Aguarde aproximadamente 12 (doze) horas antes de realizar qualquer esforço físico, especialmente como membro relacionado à doação.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text('Mantenha a compressão no local da punção.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Em caso de sangramento ou hematomas no local da punção, deve-se aplicar gelo no momento.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Comunique o Hemonúcleo caso apresente qualquer sinal ou sintoma de processo infeccioso, como febre ou diarreia, ou tenha tido o diagnóstico de alguma doença infecto-contagiosa até 7 (sete) dias após a doação.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'Comunique o Hemonúcleo caso tenha obtido o diagnóstico de malária até 30 dias após a doação.'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: ListTile(
          leading: Icon(Icons.arrow_right_alt_rounded),
          title: Text(
              'No caso de ocorrer mal-estar ao ser transportado por motocicletas ou conduzir veículos automotores logo após deixaro Hemonúcleo, faça o veículo parar imediatamente. . Caso se sinta mal longe do Hemonúcleo, deite-se elevando as pernas em nível mais alto que a cabeça até se sentir bem. Não melhorando, procure o serviço médico do Hemonúcleo.No caso de ocorrer mal-estar ao ser transportado por motocicletas ou conduzir veículos automotores logo após deixaro Hemonúcleo, faça o veículo parar imediatamente. . Caso se sinta mal longe do Hemonúcleo, deite-se elevando as pernas em nível mais alto que a cabeça até se sentir bem. Não melhorando, procure o serviço médico do Hemonúcleo.'),
        ),
      ),
    ],
  );
}
