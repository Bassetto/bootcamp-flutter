import 'package:bootcamp_flutter/app/model/bootcamp_model.dart';
import 'package:bootcamp_flutter/app/model/espaco_model.dart';
import 'package:bootcamp_flutter/app/model/usuario_model.dart';

import 'database.dart';

class BootcampRepository {
  Future<List<BootcampModel>> findAll() async {
    var db = Database();
    await db.createDatabase();

    List<BootcampModel> bootcamps = [];
    int cUsuario = 0;
    int cProfessores = 0;
    int cCandidatos = 0;
    int cData = 0;

    if (db.created) {
      bootcamps.add(BootcampModel(
        0,
        "Bootcamp teste",
        "UX",
        StatusBootcamp.PLANEJAMENTO,
        "Plano",
        "Conteudo",
        EspacoModel(0, "Rua pompeia", 15, 12345678, 50),
        DateTime.utc(2021, 5, ++cData),
        UsuarioModel((cUsuario++).toDouble(), "Coach", "coach$cUsuario@mail.com", "1234", TipoUsuario.COACH),
        [
          UsuarioModel((cUsuario++).toDouble(), "Professor ${cProfessores++}", "professor$cProfessores@mail.com", "1234", TipoUsuario.PROFESSOR),
        ],
        [
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
        ]
      ));
      bootcamps.add(BootcampModel(
        0,
        "Bootcamp teste",
        "BackEnd",
        StatusBootcamp.ANDAMENTO,
        "Plano",
        "Conteudo",
        EspacoModel(1, "Casa do caralho", 15, 12345678, 50),
        DateTime.utc(2021, 5, ++cData),
        UsuarioModel((cUsuario++).toDouble(), "Coach", "coach$cUsuario@mail.com", "1234", TipoUsuario.COACH),
        [
          UsuarioModel((cUsuario++).toDouble(), "Professor ${cProfessores++}", "professor$cProfessores@mail.com", "1234", TipoUsuario.PROFESSOR),
          UsuarioModel((cUsuario++).toDouble(), "Professor ${cProfessores++}", "professor$cProfessores@mail.com", "1234", TipoUsuario.PROFESSOR),
        ],
        [
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
          UsuarioModel((cUsuario++).toDouble(), "Candidato ${cCandidatos++}", "candidato$cCandidatos@mail.com", "1234", TipoUsuario.CANDIDATO),
        ]
      ));
    }

    return Future.value(bootcamps);
  }
}
