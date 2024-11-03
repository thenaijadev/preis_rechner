import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pricing_calculator/src/features/calculator/domain/cost_item.dart';

import '../services/calculator_state.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, CalculatorState>((ref) {
  return CalculatorNotifier();
});

class CalculatorNotifier extends StateNotifier<CalculatorState> {
  CalculatorNotifier() : super(const CalculatorState());

  void addNewRow() {
    state = state.copyWith(
      costItems: [...state.costItems, CostItem()],
    );
  }

  void deleteRow(int index) {
    final newItems = [...state.costItems];
    newItems.removeAt(index);
    state = state.copyWith(costItems: newItems);
  }

  void updateCostItem(
      {required int index, required String field, required dynamic value}) {
    final newItems = [...state.costItems];
    final item = newItems[index];

    switch (field) {
      case 'label':
        newItems[index] = item.copyWith(label: value);
        break;
      case 'costType':
        newItems[index] = item.copyWith(costType: value);
        break;
      case 'price':
        newItems[index] = item.copyWith(
          price: double.tryParse(value.toString()) ?? 0,
        );
        break;
      case 'comment':
        newItems[index] = item.copyWith(comment: value);
        break;
    }

    state = state.copyWith(costItems: newItems);
  }

  void updateProfitMargin(double value) {
    state = state.copyWith(profitMargin: value);
  }

  double calculateTotalFixedCosts() {
    return state.costItems
        .where((item) => item.costType == 'Fixed Costs')
        .map((item) => item.price)
        .fold(0, (sum, price) => sum + price!);
  }

  double calculateTotalVariableCosts() {
    return state.costItems
        .where((item) => item.costType == 'Variable Costs')
        .map((item) => item.price)
        .fold(0, (sum, price) => sum + price!);
  }
}
