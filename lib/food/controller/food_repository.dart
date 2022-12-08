import 'package:injectable/injectable.dart';
import 'package:separate_code/core/base_repository.dart';
import 'package:separate_code/food/model/food_model.dart';

@singleton
class FoodRepository extends BaseRepository<FoodModel> {
  void modifyQuantity({
    required String foodId,
    required int quantity,
  }) {
    //call api
  }

  @override
  Future<FoodModel> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    return FoodModel.defaultFood();
  }
}
