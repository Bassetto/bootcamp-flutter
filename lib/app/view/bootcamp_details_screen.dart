import 'package:bootcamp_flutter/app/core/app_text_styles.dart';
import 'package:bootcamp_flutter/app/model/bootcamp_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class BootcampDetails extends StatelessWidget {
  const BootcampDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BootcampModel? bootcamp;

    bootcamp = ModalRoute.of(context)!.settings.arguments as BootcampModel?;

    if (bootcamp == null) {
      Navigator.of(context).pop();
      return Container();
    }

    return Scaffold(
      appBar: AppBar(title: Text(bootcamp.nome), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            "Nome do bootcamp",
            style: AppTextStyles.title,
          ),
          Text(
            bootcamp.nome,
            style: AppTextStyles.body,
          ),
          espaco(),
          Text(
            "Área do bootcamp",
            style: AppTextStyles.title,
          ),
          Text(
            bootcamp.area,
            style: AppTextStyles.body,
          ),
          espaco(),
          Text(
            "Status do bootcamp",
            style: AppTextStyles.title,
          ),
          Text(
            _getStatus(bootcamp.status),
            style: AppTextStyles.body,
          ),
          espaco(),
          Text(
            "Plano de Treinamento do bootcamp",
            style: AppTextStyles.title,
          ),
          Text(
            bootcamp.planoTreinamento,
            style: AppTextStyles.body,
          ),
          espaco(),
          Text(
            "Conteúdo do bootcamp",
            style: AppTextStyles.title,
          ),
          Text(
            bootcamp.conteudo,
            style: AppTextStyles.body,
          ),
          espaco(),
          Text(
            "Data do bootcamp",
            style: AppTextStyles.title,
          ),
          Text(
            DateFormat("dd/MM/yyyy").format(bootcamp.data),
            style: AppTextStyles.body,
          ),
          espaco(),
          Text(
            "Local do bootcamp",
            style: AppTextStyles.title,
          ),
          RichText(
            text: TextSpan(
              text: bootcamp.espaco.logradouro,
              style: AppTextStyles.body,
              children: <InlineSpan>[
                TextSpan(
                  text: ", ${bootcamp.espaco.numero}",
                  style: AppTextStyles.body,
                ),
                TextSpan(
                  text: " - ${bootcamp.espaco.cep}",
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Capacidade de Pessoas:",
              style: AppTextStyles.bodyBold,
              children: <InlineSpan>[
                TextSpan(
                  text: " ${bootcamp.espaco.capacidadePessoas}",
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getStatus(StatusBootcamp status) {
    switch (status) {
      case (StatusBootcamp.PLANEJAMENTO):
        return "Planejamento";
      case (StatusBootcamp.ANDAMENTO):
        return "Andamento";
      case (StatusBootcamp.RECRUTAMENTO):
        return "Recrutamento";
      case (StatusBootcamp.VALIDACAO):
        return "Validaçao";
    }
    return "";
  }

  SizedBox espaco() => SizedBox(
        height: 20,
      );
}
