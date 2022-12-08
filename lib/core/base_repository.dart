abstract class BaseRepository<ResultType> {
  Future<ResultType> fetchData();
  Future<ResultType>? loadMore() {
    return null;
  }
}
