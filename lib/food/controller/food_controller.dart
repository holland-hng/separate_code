import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:separate_code/core/base_controller.dart';
import 'package:separate_code/food/controller/food_state.dart';
import 'package:separate_code/food/model/food_model.dart';
import 'food_repository.dart';

part 'food_quantity_behavior.dart';

abstract class FoodController {
  Rx<FoodState> get rxState;
  Rx<FoodModel> get rxFood;
  QuantityBehavior get quantityBehavior;
}

abstract class FoodControllerIntermediary
    extends BaseController<FoodModel, FoodRepository>
    implements FoodController {
  FoodControllerIntermediary(super.repository);
}

@Injectable(as: FoodController)
class FoodControllerImpl extends FoodControllerIntermediary
    with FoodQuantityHandler {
  @override
  QuantityBehavior get quantityBehavior => this;

  @override
  final Rx<FoodModel> rxFood = Rx<FoodModel>(FoodModel.defaultFood());

  FoodControllerImpl(super.repository) {
    initialize();
  }

  Future<void> initialize() async {
    rxState.value = FoodState.fetching;
    final result = await fetchData();
    result.when((FoodModel food) {
      rxFood.value = food;
      rxState.value = FoodState.loaded;
    }, (error) {
      rxState.value = FoodState.error;
    });
  }

  @override
  Rx<FoodState> rxState = FoodState.none.obs;
}
