import 'package:flutter/material.dart';
import 'package:separate_code/food/controller/food_controller.dart';

enum QuantityEnum {
  increase,
  decrease,
}

extension QuantityEnumExtension on QuantityEnum {
  Icon get icon {
    IconData iconData;
    switch (this) {
      case QuantityEnum.increase:
        iconData = Icons.add;
        break;
      case QuantityEnum.decrease:
        iconData = Icons.remove;
        break;
      default:
        throw UnimplementedError();
    }
    return Icon(iconData);
  }

  void action(QuantityBehavior behavior) {
    switch (this) {
      case QuantityEnum.increase:
        behavior.onIncreaseQuantity();
        break;
      case QuantityEnum.decrease:
        behavior.onDecreaseQuantity();
        break;
      default:
        throw UnimplementedError();
    }
  }
}

class QuantityButton extends StatelessWidget {
  final QuantityEnum type;
  const QuantityButton({
    Key? key,
    required this.behavior,
    required this.type,
  }) : super(key: key);

  final QuantityBehavior behavior;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: type.icon,
      onPressed: () {
        type.action(behavior);
      },
    );
  }
}
