import 'package:flutter/material.dart';

import 'food_controller.dart';

abstract class QuantityInteractor {
  void increase();
  void decrease();
}

mixin FoodQuantityHandler on FoodController implements QuantityInteractor {
  static const decreaseCubit = -1;
  static const increaseCubit = 1;
  @override
  void decrease() {
    mofifyQuantity(cubit: decreaseCubit);
    debugPrint("decrease");
  }

  @override
  void increase() {
    mofifyQuantity(cubit: increaseCubit);
    debugPrint("increase");
  }

  void mofifyQuantity({required int cubit}) {
    final food = rxFood.value;
    rxFood.value = food.modifyQuantity(cubit: cubit);
    repository.modifyQuantity(
      foodId: food.id,
      quantity: food.quantity,
    );
  }
}
