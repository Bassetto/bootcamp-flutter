import 'package:bootcamp_flutter/app/model/usuario_model.dart';

import 'espaco_model.dart';

class BootcampModel {
  double id;
  String nome;
  String area;
  StatusBootcamp status;
  String planoTreinamento;
  String conteudo;
  EspacoModel espaco;
  DateTime data;
  UsuarioModel coach;
  List<UsuarioModel> professores = [];
  List<UsuarioModel> candidatos = [];

  BootcampModel(
      this.id,
      this.nome,
      this.area,
      this.status,
      this.planoTreinamento,
      this.conteudo,
      this.espaco,
      this.data,
      this.coach,
      this.professores,
      this.candidatos);
}

enum StatusBootcamp {
  PLANEJAMENTO,
  ANDAMENTO,
  VALIDACAO,
  RECRUTAMENTO
}