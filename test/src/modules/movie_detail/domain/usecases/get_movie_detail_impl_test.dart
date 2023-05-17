import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/src/modules/movie_detail/domain/infra/movie_detail_repository.dart';
import 'package:marvel/src/modules/movie_detail/domain/usecases/get_movie_detail_impl.dart';
import 'package:marvel/src/modules/movie_detail/models/movie.dart';
import 'package:marvel/src/modules/movie_detail/presenter/usecases/get_movie_detail.dart';
import 'package:mocktail/mocktail.dart';

class MovieDetailRepositoryMock extends Mock implements MovieDetailRepository {}

void main() {
  late final MovieDetailRepository detailRepository;
  late final GetMovieDetail getListMovies;

  setUp(() {
    detailRepository = MovieDetailRepositoryMock();
    getListMovies = GetMovieDetailImpl(detailRepository);
  });

  final movie = Movie();

  void mockSuccessGetListMovies(){
    when(
      () => detailRepository.getDetailMovie(any<int>()),
    ).thenAnswer((_) async => movie);
  }

  test('checks number of getDetailMovie function calls', () {
    mockSuccessGetListMovies();

    getListMovies(1);

    verify(() => detailRepository.getDetailMovie(any<int>())).called(1);
  });

  test('checks the value coming from the getDetailMovie function when success', () async {
    mockSuccessGetListMovies();

    final result = await getListMovies(1);

    expect(result, isA<Movie>());
  });
}
