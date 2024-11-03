import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pricing_calculator/src/features/calculator/domain/cost_item.dart';

part 'calculator_state.freezed.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    @Default([]) List<CostItem> costItems,
    @Default(0.0) double profitMargin,
  }) = _CalculatorState;
}
