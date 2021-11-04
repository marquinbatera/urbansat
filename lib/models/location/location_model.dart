class LocationModal {
  LocationModal({
    this.eqptSerial,
    this.dhComunicacao,
    this.dhGps,
    required this.latitude,
    required this.longitude,
    this.panico,
    this.ignicao,
    this.conexaoGprs,
    this.sinalGps,
    this.modoSleep,
    this.curso,
    this.velocidade,
    this.odometro,
    this.horimetro,
    this.enderecoAproximado,
    this.statusHardware,
    this.batteryFailure,
    this.batteryCharging,
    this.gpsJamming,
    this.temperature,
    // this.driverInfo,
    this.ancorado,
  });

  int? eqptSerial;
  DateTime? dhComunicacao;
  DateTime? dhGps;
  double latitude;
  double longitude;
  bool? panico;
  bool? ignicao;
  bool? conexaoGprs;
  bool? sinalGps;
  bool? modoSleep;
  String? curso;
  String? velocidade;
  int? odometro;
  int? horimetro;
  String? enderecoAproximado;
  OutrosDados? outrosDados;
  String? statusHardware;
  String? batteryFailure;
  String? batteryCharging;
  String? gpsJamming;
  String? temperature;
  // DriverInfo? driverInfo;
  bool? ancorado;

  factory LocationModal.fromMap(Map<String, dynamic> json) => LocationModal(
        eqptSerial: json["eqpt_serial"],
        dhComunicacao: DateTime.parse(json["dh_comunicacao"]),
        dhGps: DateTime.parse(json["dh_gps"]),
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        panico: json["panico"],
        ignicao: json["ignicao"],
        conexaoGprs: json["conexao_gprs"],
        sinalGps: json["sinal_gps"],
        modoSleep: json["modo_sleep"],
        curso: json["curso"],
        velocidade: json["velocidade"],
        odometro: json["odometro"],
        horimetro: json["horimetro"],
        enderecoAproximado: json["endereco_aproximado"],
        // outrosDados: OutrosDados.fromMap(json["outros_dados"]),
        statusHardware: json["status_hardware"],
        batteryFailure: json["battery_failure"],
        batteryCharging: json["battery_charging"],
        gpsJamming: json["gps_jamming"],
        temperature: json["temperature"],
        // driverInfo: DriverInfo.fromMap(json["driver_info"]),
        ancorado: json["ancorado"],
      );

  Map<String, dynamic> toMap() => {
        "eqpt_serial": eqptSerial,
        "dh_comunicacao": dhComunicacao!.toIso8601String(),
        "dh_gps": dhGps!.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "panico": panico,
        "ignicao": ignicao,
        "conexao_gprs": conexaoGprs,
        "sinal_gps": sinalGps,
        "modo_sleep": modoSleep,
        "curso": curso,
        "velocidade": velocidade,
        "odometro": odometro,
        "horimetro": horimetro,
        "endereco_aproximado": enderecoAproximado,
        "outros_dados": outrosDados!.toMap(),
        "status_hardware": statusHardware,
        "battery_failure": batteryFailure,
        "battery_charging": batteryCharging,
        "gps_jamming": gpsJamming,
        "temperature": temperature,
        // "driver_info": driverInfo!.toMap(),
        "ancorado": ancorado,
      };
}

class DriverInfo {
  DriverInfo({
    this.nomeCompleto,
    this.dataCnh,
    this.dataMoop,
    this.idMotorista,
    this.matriculaInterna,
    this.celularPessoal,
    this.celularEmpresa,
    this.tipoSanguineo,
    this.ibuttonId,
    this.senhaPanico,
    this.senhaEmergencia,
  });

  String? nomeCompleto;
  DateTime? dataCnh;
  DateTime? dataMoop;
  String? idMotorista;
  dynamic matriculaInterna;
  dynamic celularPessoal;
  dynamic celularEmpresa;
  String? tipoSanguineo;
  int? ibuttonId;
  dynamic senhaPanico;
  dynamic senhaEmergencia;

  factory DriverInfo.fromMap(Map<String, dynamic> json) => DriverInfo(
        nomeCompleto: json["nome_completo"],
        dataCnh: DateTime.parse(json["data_cnh"]),
        dataMoop: DateTime.parse(json["data_moop"]),
        idMotorista: json["id_motorista"],
        matriculaInterna: json["matricula_interna"],
        celularPessoal: json["celular_pessoal"],
        celularEmpresa: json["celular_empresa"],
        tipoSanguineo: json["tipo_sanguineo"],
        ibuttonId: json["ibutton_id"],
        senhaPanico: json["senha_panico"],
        senhaEmergencia: json["senha_emergencia"],
      );

  Map<String, dynamic> toMap() => {
        "nome_completo": nomeCompleto,
        "data_cnh":
            "${dataCnh!.year.toString().padLeft(4, '0')}-${dataCnh!.month.toString().padLeft(2, '0')}-${dataCnh!.day.toString().padLeft(2, '0')}",
        "data_moop":
            "${dataMoop!.year.toString().padLeft(4, '0')}-${dataMoop!.month.toString().padLeft(2, '0')}-${dataMoop!.day.toString().padLeft(2, '0')}",
        "id_motorista": idMotorista,
        "matricula_interna": matriculaInterna,
        "celular_pessoal": celularPessoal,
        "celular_empresa": celularEmpresa,
        "tipo_sanguineo": tipoSanguineo,
        "ibutton_id": ibuttonId,
        "senha_panico": senhaPanico,
        "senha_emergencia": senhaEmergencia,
      };
}

class OutrosDados {
  OutrosDados({
    this.id,
    this.fixo,
    this.timezone,
    this.isMemory,
    this.idIbutton,
    this.idVeiculo,
    this.matriculaId,
    this.nomeCompleto,
  });

  String? id;
  bool? fixo;
  String? timezone;
  bool? isMemory;
  int? idIbutton;
  String? idVeiculo;
  String? matriculaId;
  String? nomeCompleto;

  factory OutrosDados.fromMap(Map<String, dynamic> json) => OutrosDados(
        id: json["id"],
        fixo: json["fixo"],
        timezone: json["timezone"],
        isMemory: json["is_memory"],
        idIbutton: json["id_ibutton"],
        idVeiculo: json["id_veiculo"],
        matriculaId: json["matricula_id"],
        nomeCompleto: json["nome_completo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fixo": fixo,
        "timezone": timezone,
        "is_memory": isMemory,
        "id_ibutton": idIbutton,
        "id_veiculo": idVeiculo,
        "matricula_id": matriculaId,
        "nome_completo": nomeCompleto,
      };
}
