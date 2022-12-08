enum FoodState {
  fetching,
  loaded,
  error,
  none,
}

extension FoodStateExtension on FoodState {
  bool get notInteraction {
    return this == FoodState.loaded;
  }
}
