import 'package:get/get.dart';
import 'package:seperate_code/food/controller/quantity_interactor.dart';
import 'package:seperate_code/food/model/food_model.dart';

import 'food_repository.dart';

class FoodControllerFactory {
  static FoodController create() {
    return FoodControllerImpl();
  }
}

abstract class FoodControllerInterface {
  final Rx<FoodModel> rxFood = Rx<FoodModel>(FoodModel.defaultFood());
  QuantityInteractor get quantityInteractor;
  void reload();
}

abstract class FoodController extends FoodControllerInterface {
  FoodRepositoty repository = FoodRepositoty();
}

class FoodControllerImpl extends FoodController with FoodQuantityHandler {
  @override
  late QuantityInteractor quantityInteractor = this;

  @override
  void reload() {}
}
