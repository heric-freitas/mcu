import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../../infra/datasources/mcu_datasources.dart';

class McuDatasourceImpl implements McuDatasource {


  @override
  Future<Map<String, dynamic>> getListMovies() async {
    try {
      final mock = await rootBundle.loadString('assets/mock/mock.json');
      final data = await json.decode(mock);
      return Future.value(data as Map<String, dynamic>);
    } on Exception catch (e, s) {
      log('Erro no McuDatasourceImpl', error: e, stackTrace: s);
      throw Exception('Erro no McuDatasourceImpl');
    }
  }
}
