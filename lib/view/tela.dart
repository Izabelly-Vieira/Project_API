import 'package:flutter/material.dart';
import 'package:projeto_api/data/dataController.dart';
import 'package:projeto_api/model/moneyModel.dart';

class telaSplash extends StatefulWidget {
  const telaSplash({Key? key}) : super(key: key);

  @override
  State<telaSplash> createState() => _telaSplashState();
}

class _telaSplashState extends State<telaSplash> {

  moneyModel model = moneyModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
        FutureBuilder<moneyModel?>(
          future: DataController().getMoney(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if (snapshot.error == true) {
              return Text("Erro ao carregar!");
            }
            model = snapshot?.data ?? model;
            return Text(model.bTCBRL?.name ?? "");

          }
          )
      ],
      )
    );
  }
}

