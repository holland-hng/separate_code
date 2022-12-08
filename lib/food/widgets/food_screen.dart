import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:separate_code/food/controller/food_controller.dart';
import '../controller/food_quantity_behavior.dart';
import 'quantity_button.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final FoodController controller = FoodControllerFactory.create();
  late QuantityBehavior quantityBehavior = controller.quantityBehavior;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food")),
      body: Center(
        child: Obx(
          () {
            return Text("quantity : ${controller.rxFood.value.quantity}");
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
