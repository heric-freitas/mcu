import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/src/modules/mcu/domain/infra/mcu_repository.dart';
import 'package:marvel/src/modules/mcu/domain/usecases/get_list_movies_impl.dart';
import 'package:marvel/src/modules/mcu/models/movies.dart';
import 'package:marvel/src/modules/mcu/presenter/usecases/get_list_movies.dart';
import 'package:mocktail/mocktail.dart';

class McuRepositoryMock extends Mock implements McuRepository {}

void main() {
  late final McuRepository mcuRepository;
  late final GetListMovies getListMovies;

  setUp(() {
    mcuRepository = McuRepositoryMock();
    getListMovies = GetListMoviesImpl(mcuRepository);
  });

  final listMovie = <Movies>[
    Movies(),
    Movies(),
  ];

  void mockSuccessGetListMovies(){
    when(
      () => mcuRepository.getListMovies(),
    ).thenAnswer((_) async => listMovie);
  }

  test('checks number of getListMovies function calls', () {
    mockSuccessGetListMovies();

    getListMovies();

    verify(() => mcuRepository.getListMovies()).called(1);
  });

  test('checks the value coming from the getListMovies function when success', () async {
    mockSuccessGetListMovies();

    final result = await getListMovies();

    expect(result, isA<List<Movies>>());
    expect(result.length, 2);
  });
}
