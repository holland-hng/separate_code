part of 'food_controller.dart';

abstract class QuantityBehavior {
  void onIncreaseQuantity();
  void onDecreaseQuantity();
}

mixin FoodQuantityHandler on FoodControllerIntermediary
    implements QuantityBehavior {
  static const decreaseCubit = -1;
  static const increaseCubit = 1;
  @override
  void onDecreaseQuantity() {
    modifyQuantity(cubit: decreaseCubit);
    debugPrint("decrease");
  }

  @override
  void onIncreaseQuantity() {
    modifyQuantity(cubit: increaseCubit);
    debugPrint("increase");
  }

  @protected
  void modifyQuantity({required int cubit}) {
    if (rxState.value.notInteraction) return;

    final food = rxFood.value;
    rxFood.value = food.modifyQuantity(cubit: cubit);
    repository.modifyQuantity(
      foodId: food.id,
      quantity: food.quantity,
    );
  }
}
