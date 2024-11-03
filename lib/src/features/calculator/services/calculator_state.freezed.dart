// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculatorState {
  List<CostItem> get costItems => throw _privateConstructorUsedError;
  double get profitMargin => throw _privateConstructorUsedError;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res, CalculatorState>;
  @useResult
  $Res call({List<CostItem> costItems, double profitMargin});
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res, $Val extends CalculatorState>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costItems = null,
    Object? profitMargin = null,
  }) {
    return _then(_value.copyWith(
      costItems: null == costItems
          ? _value.costItems
          : costItems // ignore: cast_nullable_to_non_nullable
              as List<CostItem>,
      profitMargin: null == profitMargin
          ? _value.profitMargin
          : profitMargin // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculatorStateImplCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$$CalculatorStateImplCopyWith(_$CalculatorStateImpl value,
          $Res Function(_$CalculatorStateImpl) then) =
      __$$CalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CostItem> costItems, double profitMargin});
}

/// @nodoc
class __$$CalculatorStateImplCopyWithImpl<$Res>
    extends _$CalculatorStateCopyWithImpl<$Res, _$CalculatorStateImpl>
    implements _$$CalculatorStateImplCopyWith<$Res> {
  __$$CalculatorStateImplCopyWithImpl(
      _$CalculatorStateImpl _value, $Res Function(_$CalculatorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costItems = null,
    Object? profitMargin = null,
  }) {
    return _then(_$CalculatorStateImpl(
      costItems: null == costItems
          ? _value._costItems
          : costItems // ignore: cast_nullable_to_non_nullable
              as List<CostItem>,
      profitMargin: null == profitMargin
          ? _value.profitMargin
          : profitMargin // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CalculatorStateImpl implements _CalculatorState {
  const _$CalculatorStateImpl(
      {final List<CostItem> costItems = const [], this.profitMargin = 0.0})
      : _costItems = costItems;

  final List<CostItem> _costItems;
  @override
  @JsonKey()
  List<CostItem> get costItems {
    if (_costItems is EqualUnmodifiableListView) return _costItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_costItems);
  }

  @override
  @JsonKey()
  final double profitMargin;

  @override
  String toString() {
    return 'CalculatorState(costItems: $costItems, profitMargin: $profitMargin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatorStateImpl &&
            const DeepCollectionEquality()
                .equals(other._costItems, _costItems) &&
            (identical(other.profitMargin, profitMargin) ||
                other.profitMargin == profitMargin));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_costItems), profitMargin);

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith =>
      __$$CalculatorStateImplCopyWithImpl<_$CalculatorStateImpl>(
          this, _$identity);
}

abstract class _CalculatorState implements CalculatorState {
  const factory _CalculatorState(
      {final List<CostItem> costItems,
      final double profitMargin}) = _$CalculatorStateImpl;

  @override
  List<CostItem> get costItems;
  @override
  double get profitMargin;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
