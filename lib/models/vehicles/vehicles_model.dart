class VehiclesModel {
  VehiclesModel({
    required this.id,
    this.placa,
    this.modelo,
    this.anoFabricacao,
    this.organizacao,
    this.entidade,
    this.situacao,
    this.ativo,
    this.serialEquipamento,
    this.tipo,
    this.fabricante,
    this.unidade,
    this.eqptoModelo,
    this.inputsNames,
    this.outputsNames,
    this.cor,
    this.ignicao,
  });

  String id;
  String? placa;
  String? modelo;
  int? anoFabricacao;
  String? organizacao;
  String? entidade;
  String? situacao;
  bool? ativo;
  int? serialEquipamento;
  String? tipo;
  String? fabricante;
  String? unidade;
  String? eqptoModelo;
  InputsNames? inputsNames;
  OutputsNames? outputsNames;
  String? cor;
  bool? ignicao;

  VehiclesModel copyWith({
    String? id,
    String? placa,
    String? modelo,
    int? anoFabricacao,
    String? organizacao,
    String? entidade,
    String? situacao,
    bool? ativo,
    int? serialEquipamento,
    String? tipo,
    String? fabricante,
    String? unidade,
    String? eqptoModelo,
    String? cor,
    bool? ignicao,
  }) {
    return VehiclesModel(
      id: id ?? this.id,
      placa: placa ?? this.placa,
      modelo: modelo ?? this.modelo,
      anoFabricacao: anoFabricacao ?? this.anoFabricacao,
      organizacao: organizacao ?? this.organizacao,
      entidade: entidade ?? this.entidade,
      situacao: situacao ?? this.situacao,
      ativo: ativo ?? this.ativo,
      serialEquipamento: serialEquipamento ?? this.serialEquipamento,
      tipo: tipo ?? this.tipo,
      fabricante: fabricante ?? this.fabricante,
      unidade: unidade ?? this.unidade,
      eqptoModelo: eqptoModelo ?? this.eqptoModelo,
      cor: cor ?? this.cor,
      ignicao: ignicao ?? this.ignicao,
    );
  }

  factory VehiclesModel.fromMap(Map<String, dynamic> json) => VehiclesModel(
        id: json["id"],
        placa: json["placa"],
        modelo: json["modelo"],
        anoFabricacao: json["ano_fabricacao"],
        organizacao: json["organizacao"],
        entidade: json["entidade"],
        situacao: json["situacao"],
        ativo: json["ativo"],
        serialEquipamento: json["serial_equipamento"],
        tipo: json["tipo"],
        fabricante: json["fabricante"],
        unidade: json["unidade"],
        eqptoModelo: json["eqpto_modelo"],
        inputsNames: InputsNames.fromMap(json["inputs_names"]),
        outputsNames: OutputsNames.fromMap(json["outputs_names"]),
        cor: json["cor"],
        ignicao: json["ignicao"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "placa": placa,
        "modelo": modelo,
        "ano_fabricacao": anoFabricacao,
        "organizacao": organizacao,
        "entidade": entidade,
        "situacao": situacao,
        "ativo": ativo,
        "serial_equipamento": serialEquipamento,
        "tipo": tipo,
        "fabricante": fabricante,
        "unidade": unidade,
        "eqpto_modelo": eqptoModelo,
        "inputs_names": inputsNames!.toMap(),
        "outputs_names": outputsNames!.toMap(),
        "cor": cor,
        "ignicao": ignicao,
      };
}

class InputsNames {
  InputsNames({
    this.input1,
    this.input2,
    this.input3,
    this.input4,
    this.input5,
    this.input6,
    this.input7,
    this.input8,
  });

  String? input1;
  String? input2;
  String? input3;
  String? input4;
  String? input5;
  String? input6;
  String? input7;
  String? input8;

  factory InputsNames.fromMap(Map<String, dynamic> json) => InputsNames(
        input1: json["input1"],
        input2: json["input2"],
        input3: json["input3"],
        input4: json["input4"],
        input5: json["input5"],
        input6: json["input6"],
        input7: json["input7"],
        input8: json["input8"],
      );

  Map<String, dynamic> toMap() => {
        "input1": input1,
        "input2": input2,
        "input3": input3,
        "input4": input4,
        "input5": input5,
        "input6": input6,
        "input7": input7,
        "input8": input8,
      };
}

class OutputsNames {
  OutputsNames({
    this.output1,
    this.output2,
    this.output3,
    this.output4,
    this.output5,
    this.output6,
    this.output7,
    this.output8,
  });

  String? output1;
  String? output2;
  String? output3;
  String? output4;
  String? output5;
  String? output6;
  String? output7;
  String? output8;

  factory OutputsNames.fromMap(Map<String, dynamic> json) => OutputsNames(
        output1: json["output1"],
        output2: json["output2"],
        output3: json["output3"],
        output4: json["output4"],
        output5: json["output5"],
        output6: json["output6"],
        output7: json["output7"],
        output8: json["output8"],
      );

  Map<String, dynamic> toMap() => {
        "output1": output1,
        "output2": output2,
        "output3": output3,
        "output4": output4,
        "output5": output5,
        "output6": output6,
        "output7": output7,
        "output8": output8,
      };
}
