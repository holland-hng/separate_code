import 'package:flutter/material.dart';

import 'food_controller.dart';

abstract class QuantityBehavior {
  void increase();
  void decrease();
}

mixin FoodQuantityHandler on FoodController implements QuantityBehavior {
  static const decreaseCubit = -1;
  static const increaseCubit = 1;
  @override
  void decrease() {
    modifyQuantity(cubit: decreaseCubit);
    debugPrint("decrease");
  }

  @override
  void increase() {
    modifyQuantity(cubit: increaseCubit);
    debugPrint("increase");
  }

  void modifyQuantity({required int cubit}) {
    final food = rxFood.value;
    rxFood.value = food.modifyQuantity(cubit: cubit);
    repository.modifyQuantity(
      foodId: food.id,
      quantity: food.quantity,
    );
  }
}
