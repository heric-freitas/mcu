import 'dart:developer';

import 'package:marvel/src/modules/mcu/infra/datasources/mcu_datasources.dart';

import '../../domain/infra/mcu_repository.dart';
import '../../models/movies.dart';

class McuRepositoryImpl implements McuRepository {
  final McuDatasource _mcuDatasource;

  McuRepositoryImpl(this._mcuDatasource);

  @override
  Future<List<Movies>> getListMovies() async {
    try {
      final result = await _mcuDatasource.getListMovies();
      return (result['mcu'] as List).map((e) => Movies.fromMap(e)).toList();
    } on Exception catch (e, s) {
      log('Erro no McuRepositoryImpl', error: e, stackTrace: s);
      throw Exception('Erro no McuRepositoryImpl');
    }
  }
}
