import 'dart:developer';

import 'package:marvel/src/modules/movie_detail/infra/datasources/movie_detail_datasource.dart';

import '../mock/mock_movie_detail.dart';

class MovieDetailDatasourceImpl implements MovieDetailDatasource {
  @override
  Future<Map<String, dynamic>> getDetailMovie(int id) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final list = movieDetail['mcu'] as List;
      return Future.value(list.firstWhere((element) => element['id'] == id));
    } on Exception catch (e, s) {
      log('Erro no MovieDetailDetasourceImpl', error: e, stackTrace: s);
      throw Exception('Erro no MovieDetailDetasourceImpl');
    }
  }
}