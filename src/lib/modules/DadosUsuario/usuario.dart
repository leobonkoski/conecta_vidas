/// Classe geral que atua junto da api para trabalhar com os dados do usuário e datas de doação de sangue  ///

class Usuario {
  String mATRIC = '';
  String nOMEDOA = '';
  String dATANASC = '';
  String sEXO = '';
  String fONER = '';
  String gRABO = '';
  String fATORRH = '';
  String eMAIL = '';
  String fONE2 = '';
  String cPF = '';
  String dOACAO = '';

  Usuario(
      String mATRIC,
      String nOMEDOA,
      String sEXO,
      String fONER,
      String dATANASC,
      String gRABO,
      String fATORRH,
      String eMAIL,
      String fONE2,
      String cPF,
      String dOACAO) {
    this.mATRIC = mATRIC;
    this.nOMEDOA = nOMEDOA;
    this.dATANASC = dATANASC;
    this.sEXO = sEXO;
    this.fONER = fONER;
    this.gRABO = gRABO;
    this.fATORRH = fATORRH;
    this.eMAIL = eMAIL;
    this.fONE2 = fONE2;
    this.cPF = cPF;
    this.dOACAO = dOACAO;
  }

  Usuario.fromJson(Map json)
      : mATRIC = json['MATRIC'],
        nOMEDOA = json['NOME_DOA'],
        dATANASC = json['DATA_NASC'],
        sEXO = json['SEXO'],
        fONER = json['FONE_R'],
        gRABO = json['GR_ABO'],
        fATORRH = json['FATOR_RH'],
        eMAIL = json['EMAIL'],
        fONE2 = json['FONE2'],
        cPF = json['CPF'],
        dOACAO = json['DTHR_COLI'];

  Map toJson() {
    return {'MATRIC': mATRIC, 'NOME_DOA': nOMEDOA};
  }
}
