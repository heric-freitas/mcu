import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../../infra/datasources/movie_detail_datasource.dart';


class MovieDetailDatasourceImpl implements MovieDetailDatasource {
  @override
  Future<Map<String, dynamic>> getDetailMovie(int id) async {
    try {
      final mock = await rootBundle.loadString('assets/mock/mock.json');
      final list = await json.decode(mock);
      return Future.value(list['mcu'].firstWhere((element) => element['id'] == id));
    } on Exception catch (e, s) {
      log('Erro no MovieDetailDetasourceImpl', error: e, stackTrace: s);
      throw Exception('Erro no MovieDetailDetasourceImpl');
    }
  }
}