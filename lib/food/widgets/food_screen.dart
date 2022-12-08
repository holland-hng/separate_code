import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:separate_code/di/di.dart';
import 'package:separate_code/food/controller/food_controller.dart';
import 'package:separate_code/food/controller/food_state.dart';
import 'quantity_button.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final controller = getIt<FoodController>();
  late QuantityBehavior quantityBehavior = controller.quantityBehavior;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food")),
      body: Center(
        child: Obx(
          () {
            final state = controller.rxState.value;
            switch (state) {
              case FoodState.fetching:
              case FoodState.none:
                return const CircularProgressIndicator();
              case FoodState.loaded:
                return Text("quantity : ${controller.rxFood.value.quantity}");
              case FoodState.error:
                return const Text("Error");
              default:
                throw UnimplementedError();
            }
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuantityButton(
              behavior: quantityBehavior,
              type: QuantityEnum.increase,
            ),
            const SizedBox(width: 20),
            QuantityButton(
              behavior: quantityBehavior,
              type: QuantityEnum.decrease,
            ),
          ],
        ),
      ),
    );
  }
}
