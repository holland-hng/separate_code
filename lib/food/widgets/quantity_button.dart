import 'package:flutter/material.dart';

import '../controller/quantity_interactor.dart';

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

  void action(QuantityInteractor interactor) {
    switch (this) {
      case QuantityEnum.increase:
        interactor.increase();
        break;
      case QuantityEnum.decrease:
        interactor.decrease();
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
    required this.interactor,
    required this.type,
  }) : super(key: key);

  final QuantityInteractor interactor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: type.icon,
      onPressed: () {
        type.action(interactor);
      },
    );
  }
}
