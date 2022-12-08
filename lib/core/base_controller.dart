import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_repository.dart';

abstract class BaseController<ResultType,
    RepositoryType extends BaseRepository<ResultType>> {
  final RepositoryType repository;

  bool isFetching = false;

  BaseController(this.repository);

  Future<Result<ResultType, Exception>> fetchData() async {
    try {
      assert(isFetching == false);
      isFetching = true;
      final ResultType result = await repository.fetchData();
      return Success(result);
    } catch (e) {
      handleError(e);
      return Error(Exception("fetchData fail: ${e.toString()}"));
    } finally {
      isFetching = false;
    }
  }

  void handleError(Object e) {
    debugPrint(e.toString());
  }
}
