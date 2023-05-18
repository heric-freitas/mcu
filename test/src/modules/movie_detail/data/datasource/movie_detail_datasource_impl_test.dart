import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/src/modules/movie_detail/data/datasource/movie_detail_datasource_impl.dart';
import 'package:marvel/src/modules/movie_detail/infra/datasources/movie_detail_datasource.dart';

import '../mock/mock_json.dart';


void main() {
  late final MovieDetailDatasource mcuDatasource;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mcuDatasource = MovieDetailDatasourceImpl();
  });

  test('read json with success', () async {
    final result = await mcuDatasource.getDetailMovie(1927);

    expect(result, isA<Map<String, dynamic>>());
    expect(result, mockJson);
  });
}
