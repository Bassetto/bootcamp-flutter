import 'package:bootcamp_flutter/app/components/loading_widget.dart';
import 'package:bootcamp_flutter/app/core/app_text_styles.dart';
import 'package:bootcamp_flutter/app/model/bootcamp_model.dart';
import 'package:bootcamp_flutter/app/repository/bootcamp_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BootcampList extends StatefulWidget {
  const BootcampList({Key? key}) : super(key: key);

  @override
  _BootcampListState createState() => _BootcampListState();
}

class _BootcampListState extends State<BootcampList> {
  Future<List<BootcampModel>> _future = BootcampRepository().findAll();

  List<BootcampModel> _bootcamps = [];

  @override
  void initState() {
    _future.then((value) {
      setState(() {
        _bootcamps.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bootcamps"), centerTitle: true),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(_bootcamps);
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }

  ListView buildListView(List<BootcampModel> bootcamps) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: bootcamps.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 10,
          child: ListTile(
            leading: Text(
              bootcamps[index].area,
              style: AppTextStyles.body,
            ),
            title: Text(
              bootcamps[index].nome,
              style: AppTextStyles.body,
            ),
            subtitle: Text(
                bootcamps[index].conteudo,
                style: AppTextStyles.body,
                overflow: TextOverflow.fade),
            trailing: Text(
              DateFormat("dd/MM/yyyy").format(bootcamps[index].data),
              style: AppTextStyles.body,
            ),
            onTap: () => Navigator.of(context)
                .pushNamed("/bootcampDetails", arguments: bootcamps[index]),
          ),
        );
      },
    );
  }
}
