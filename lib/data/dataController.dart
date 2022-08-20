import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_api/model/moneyModel.dart';

import 'api.dart';

class DataController{
    final api = API();

    Future<moneyModel?> getMoney ()async{
      try{
          final response = await api.get("https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL");
          if(response?.statusCode == 200){
            return moneyModel.fromJson(json.decode(json.encode(response?.data)));
          }
      } catch (e) {
          rethrow;
      }

    }

}