import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/src/modules/movie_detail/data/mock/mock_movie_detail.dart';
import 'package:marvel/src/modules/movie_detail/domain/infra/movie_detail_repository.dart';
import 'package:marvel/src/modules/movie_detail/infra/datasources/movie_detail_datasource.dart';
import 'package:marvel/src/modules/movie_detail/infra/repository/movie_detail_repository_impl.dart';
import 'package:marvel/src/modules/movie_detail/models/movie.dart';
import 'package:mocktail/mocktail.dart';

class MovieDetailDatasourceMock extends Mock implements MovieDetailDatasource {}

void main() {
  late MovieDetailDatasource movieDetailDatasource;
  late MovieDetailRepository repository;

  setUp(() {
    movieDetailDatasource = MovieDetailDatasourceMock();
    repository = MovieDetailRepositoryImpl(movieDetailDatasource);
  });

  void mockSuccessGetListMovies() {
    when(
      () => movieDetailDatasource.getDetailMovie(1771),
    ).thenAnswer((_) async => (movieDetail['mcu'] as List)
        .firstWhere((element) => element['id'] == 1771));
  }

  void mockFailureGetListMovies() {
    when(
      () => movieDetailDatasource.getDetailMovie(1771),
    ).thenThrow(Exception());
  }

  test('checks number of getDetailMovie function calls', () async {
    mockSuccessGetListMovies();

    await repository.getDetailMovie(1771);

    verify(() => movieDetailDatasource.getDetailMovie(1771)).called(1);
  });

  test('checks the value coming from the getDetailMovie function when success',
      () async {
    mockSuccessGetListMovies();

    final result = await repository.getDetailMovie(1771);

    expect(result, isA<Movie>());
  });

  test('checks the value coming from the getDetailMovie function when failure',
      () async {
    try {
      mockFailureGetListMovies();

      await repository.getDetailMovie(1771);
    } on Exception catch (e) {
      expect(e, isA<Exception>());
      expect(e.toString(), "Exception: Erro no MovieDetailRepositoryImpl");
    }
  });
}
