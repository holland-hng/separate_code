import 'package:get/get.dart';
import 'package:separate_code/food/controller/food_quantity_behavior.dart';
import 'package:separate_code/food/model/food_model.dart';

import 'food_repository.dart';

class FoodControllerFactory {
  static FoodController create() {
    return FoodControllerImpl();
  }
}

abstract class FoodControllerInterface {
  final Rx<FoodModel> rxFood = Rx<FoodModel>(FoodModel.defaultFood());
  QuantityBehavior get quantityBehavior;
  void reload();
}

abstract class FoodController extends FoodControllerInterface {
  FoodRepository repository = FoodRepository();
}

class FoodControllerImpl extends FoodController with FoodQuantityHandler {
  @override
  late QuantityBehavior quantityBehavior = this;

  @override
  void reload() {}
}
