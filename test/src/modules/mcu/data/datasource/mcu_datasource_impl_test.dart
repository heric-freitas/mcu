import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/src/modules/mcu/data/datasource/mcu_datasource_impl.dart';
import 'package:marvel/src/modules/mcu/infra/datasources/mcu_datasources.dart';

import '../mock/mock_json.dart';

void main() {
  late final McuDatasource mcuDatasource;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mcuDatasource = McuDatasourceImpl();
  });

  test('read json with success', () async {
    final result = await mcuDatasource.getListMovies();

    expect(result, isA<Map<String, dynamic>>());
    expect(result, mockJson);
  });
}
