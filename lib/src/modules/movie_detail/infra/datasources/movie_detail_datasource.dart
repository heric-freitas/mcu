abstract interface class MovieDetailDatasource {
  Future<Map<String, dynamic>> getDetailMovie(int id);
}