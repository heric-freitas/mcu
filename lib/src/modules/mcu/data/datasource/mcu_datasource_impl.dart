import 'dart:developer';

import '../../infra/datasources/mcu_datasources.dart';
import '../mock/mock.dart';

class McuDatasourceImpl implements McuDatasource {
  @override
  Future<Map<String, dynamic>> getListMovies() async {
    try {
      await Future.delayed(const Duration(seconds: 6));
      return Future.value(getMovies);
    } on Exception catch (e, s) {
      log('Erro no McuDatasourceImpl', error: e, stackTrace: s);
      throw Exception('Erro no McuDatasourceImpl');
    }
  }
}
