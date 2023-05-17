import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/src/modules/mcu/data/mock/mock.dart';
import 'package:marvel/src/modules/mcu/domain/infra/mcu_repository.dart';
import 'package:marvel/src/modules/mcu/infra/datasources/mcu_datasources.dart';
import 'package:marvel/src/modules/mcu/infra/repository/mcu_repository_impl.dart';
import 'package:marvel/src/modules/mcu/models/movies.dart';
import 'package:mocktail/mocktail.dart';

class McuDatasourceMock extends Mock implements McuDatasource {}

void main() {
  late McuDatasource mcuDatasource;
  late McuRepository repository;

  setUp(() {
    mcuDatasource = McuDatasourceMock();
    repository = McuRepositoryImpl(mcuDatasource);
  });

  void mockSuccessGetListMovies() {
    when(
      () => mcuDatasource.getListMovies(),
    ).thenAnswer((_) async => getMovies);
  }

  void mockFailureGetListMovies() {
    when(
      () => mcuDatasource.getListMovies(),
    ).thenThrow(Exception());
  }

  test('checks number of getListMovies function calls', () {
    mockSuccessGetListMovies();

    repository.getListMovies();

    verify(() => mcuDatasource.getListMovies()).called(1);
  });

  test('checks the value coming from the getListMovies function when success',
      () async {
    mockSuccessGetListMovies();

    final result = await repository.getListMovies();

    expect(result, isA<List<Movies>>());
    expect(result.length, 24);
  });

  test('checks the value coming from the getListMovies function when failure',
      () async {
    try {
      mockFailureGetListMovies();

      await repository.getListMovies();
    } on Exception catch (e) {
      expect(e, isA<Exception>());
      expect(e.toString(), "Exception: Erro no McuRepositoryImpl");
    }
  });
}
