import 'dart:math';

import 'package:separate_code/food/model/food_entity.dart';

class FoodModel extends FoodEntity {
  FoodModel({
    required super.id,
    required super.name,
    required super.remain,
    required super.price,
    required super.quantity,
  });

  FoodModel modifyQuantity({required int cubit}) {
    int newQuantity = quantity + cubit;
    newQuantity = max(1, newQuantity);
    newQuantity = min(remain, newQuantity);
    return FoodModel(
      id: id,
      name: name,
      remain: remain,
      price: price,
      quantity: newQuantity,
    );
  }

  static FoodModel defaultFood() {
    return FoodModel(
      id: "10",
      name: "name",
      remain: 10,
      price: 20,
      quantity: 1,
    );
  }
}
